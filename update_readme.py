import os
import re

def parse_rb_file(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
    except OSError as e:
        # Log which file failed to be read for debugging purposes
        print(f"Warning: Could not read {file_path}: {e}")
        # If the file cannot be read, return "unknown" version and empty link so that the package is listed without a release link
        return "unknown", ""

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
        repo_match = re.search(r"url\s+['\"]https://github\.com/([^/]+/[^/]+?)(?=/|['\"])", content)

    if repo_match:
        repo_path = repo_match.group(1).rstrip('/')
        repo_url = f"https://github.com/{repo_path}"
        
        # If version is unknown, link to latest release
        if version == "unknown":
            release_link = f"{repo_url}/releases/latest"
        else:
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
    base_dir = '.'
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
            # Always use a markdown link when a release URL is available; use "latest" as link text
            # when the version is unknown so we don't claim a specific version number.
            if version == "unknown":
                table += f"| `{name}` | [latest]({link}) |\n"
            else:
                table += f"| `{name}` | [{version}]({link}) |\n"
        else:
            table += f"| `{name}` | {version} |\n"

    # Update README.md
    readme_path = os.path.join(base_dir, 'README.md')
    try:
        with open(readme_path, 'r', encoding='utf-8') as f:
            readme_content = f.read()
    except OSError as e:
        print(f"Error reading README.md: {e}")
        return

    # Replace the section under ## Available Packages
    # We look for ## Available Packages and replace everything after it until the next header or end of file
    pattern = r'(## Available Packages\n\n).*?(?=\n##|$)'
    new_readme = re.sub(
        pattern,
        f'\\1{table}',
        readme_content,
        flags=re.DOTALL
    )

    # Strip trailing whitespace/newlines from the entire README
    new_readme = new_readme.rstrip() + '\n'

    try:
        with open(readme_path, 'w', encoding='utf-8') as f:
            f.write(new_readme)
    except OSError as e:
        print(f"Error writing README.md: {e}")
        return

if __name__ == "__main__":
    main()
