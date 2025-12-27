import os
import re

def extract_info(file_path):
    with open(file_path, 'r') as f:
        content = f.read()

    # Extract version
    version_match = re.search(r'version\s+"([^"]+)"', content)
    version = version_match.group(1) if version_match else None

    # Extract url(s). Some casks may define multiple URLs (e.g., on_arm/on_intel).
    url_matches = re.findall(r'url\s+"([^"]+)"', content)
    if not url_matches:
        return None

    # Deterministically select a URL: prefer a GitHub releases download URL, otherwise use the first.
    url = None
    for candidate_url in url_matches:
        if "github.com" in candidate_url and "/releases/download/" in candidate_url:
            url = candidate_url
            break
    if url is None:
        url = url_matches[0]

    # If version is not explicitly defined, try to infer it from url
    # Homebrew formulas often have version in the URL if not specified
    if not version:
        # Try to find version-like string in URL
        # e.g., /v0.2.4/ or /0.2.4/
        v_match = re.search(r'/v?(\d+\.\d+\.\d+[^/]*)/', url)
        if v_match:
            version = v_match.group(1)

    if not version:
        return None

    # Transform GitHub release URL
    # https://github.com/{user}/{repo}/releases/download/{tag}/{artifact}
    # -> https://github.com/{user}/{repo}/releases/tag/{tag}
    github_release_match = re.search(r'(https://github\.com/[^/]+/[^/]+)/releases/download/([^/]+)/', url)
    if github_release_match:
        base_url = github_release_match.group(1)
        tag = github_release_match.group(2)

        # Replace #{version} with actual version
        tag = tag.replace('#{version}', version)
        release_url = f"{base_url}/releases/tag/{tag}"
        return version, release_url

    return None

def main():
    packages = []
    root_dir = os.getcwd()

    for root, dirs, files in os.walk(root_dir):
        # Skip hidden directories like .git
        dirs[:] = [d for d in dirs if not d.startswith('.')]

        for filename in files:
            if filename.endswith('.rb'):
                package_name = filename[:-3]
                file_path = os.path.join(root, filename)
                info = extract_info(file_path)
                if info:
                    version, release_url = info
                    packages.append({
                        'name': package_name,
                        'version': version,
                        'url': release_url
                    })

    packages.sort(key=lambda x: x['name'])

    # Update README.md
    readme_path = os.path.join(root_dir, 'README.md')
    if not os.path.isfile(readme_path):
        raise FileNotFoundError(f"README.md not found at expected path: {readme_path}")
    with open(readme_path, 'r') as f:
        readme_content = f.read()

    # Prepare the new section
    table_header = "| Package Name | Release            |\n| ------------ | ------------------ |\n"
    table_rows = ""

    for pkg in packages:
        table_rows += f"| `{pkg['name']}`  | [{pkg['version']}]({pkg['url']}) |\n"

    new_section = f"## Available Packages\n\n{table_header}{table_rows}\n"

    # Replace the section in README.md
    # We look for ## Available Packages and replace until the end of the file or next header
    pattern = r'## Available Packages.*?(?=\n##|$)'
    updated_readme = re.sub(pattern, new_section, readme_content, flags=re.DOTALL)

    with open(readme_path, 'w') as f:
        f.write(updated_readme)

    print(f"Updated README.md with {len(packages)} packages.")

if __name__ == "__main__":
    main()
