import os
import re

def parse_rb_file(file_path):
    with open(file_path, 'r') as f:
        content = f.read()

    # Extract version
    version_match = re.search(r"version\s+['\"]([^'\"]+)['\"]", content)
    if version_match:
        version = version_match.group(1)
    else:
        # Try to extract from URL if version is not explicitly defined
        url_match = re.search(r"url\s+['\"]([^'\"]+)['\"]", content)
        if url_match:
            url = url_match.group(1)
            # Common pattern: .../v0.2.4/... or .../0.2.4/...
            v_match = re.search(r'/v?(\d+\.\d+\.\d+[^/]*)/', url)
            if v_match:
                version = v_match.group(1)
            else:
                version = "unknown"
        else:
            version = "unknown"

    # Extract GitHub repo
    # Try homepage first
    repo_match = re.search(r"homepage\s+['\"]https://github\.com/([^/]+/[^/'\"]+)['\"]", content)
    if not repo_match:
        # Try URL
        repo_match = re.search(r"url\s+['\"]https://github\.com/([^/]+/[^/]+)/releases", content)

    if repo_match:
        repo_path = repo_match.group(1).rstrip('/')
        repo_url = f"https://github.com/{repo_path}"
        # Determine if tag has 'v' prefix
        # Check if 'v#{version}' or 'v' + version is in the URL
        if f'v{version}' in content or f'v#{{version}}' in content:
            tag = f'v{version}'
        else:
            tag = version
        release_link = f"{repo_url}/releases/tag/{tag}"
    else:
        release_link = ""

    return version, release_link

def main():
    base_dir = os.path.dirname('.')
    packages = []
    for folder in ['Casks', 'Formula']:
        folder_path = os.path.join(base_dir, folder)
        if not os.path.exists(folder_path):
            continue
        for filename in os.listdir(folder_path):
            if filename.endswith('.rb'):
                name = filename[:-3]
                version, link = parse_rb_file(os.path.join(folder_path, filename))
                packages.append((name, version, link))

    packages.sort()

    # Generate table
    table = "| Package Name | Version |\n|--------------|---------|\n"
    for name, version, link in packages:
        if link:
            table += f"| `{name}` | [{version}]({link}) |\n"
        else:
            table += f"| `{name}` | {version} |\n"

    # Update README.md
    readme_path = os.path.join(base_dir, 'README.md')
    with open(readme_path, 'r') as f:
        readme_content = f.read()

    # Replace the section under ## Available Packages
    # We look for ## Available Packages and replace everything after it until the next header or end of file
    pattern = r'(## Available Packages\n\n).*?(?=\n##|$)'
    new_readme = re.sub(
        pattern,
        f'\\1{table}',
        readme_content,
        flags=re.DOTALL
    )

    with open(readme_path, 'w') as f:
        f.write(new_readme)

if __name__ == "__main__":
    main()
