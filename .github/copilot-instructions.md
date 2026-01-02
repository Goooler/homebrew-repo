# GitHub Copilot Custom Instructions for Goooler's Homebrew Repo

## Repository Overview

This is a Homebrew tap repository that provides custom casks and formulas for macOS applications and command-line tools. All contributions must follow specific Homebrew conventions and maintain alphabetical ordering.

## Code Review Guidelines

When reviewing code or making suggestions, ensure the following:

### For All Contributions

1. **README.md Updates**: Every new cask or formula MUST include an update to `README.md`:
   - Add a new row in the "Available Packages" table in alphabetical order
   - Add the corresponding reference link at the bottom in alphabetical order
   - Use backticks around package names: `` `package-name` ``
   - Follow exact format of existing entries

2. **Alphabetical Ordering**: All entries must be in alphabetical order:
   - Package names in the README.md table
   - Reference links in the README.md
   - This is critical and must be verified

3. **Style and Audit Checks**: All casks and formulas must pass:
   ```sh
   brew style --fix ./Casks/package-name.rb
   brew audit --cask --strict ./Casks/package-name.rb
   # OR for formulas:
   brew style --fix ./Formula/package-name.rb
   brew audit --strict ./Formula/package-name.rb
   ```

### For Casks (macOS Applications)

Reference files for examples:
- **Universal binary**: `Casks/any-portal.rb` - single binary for both Apple Silicon and Intel
- **Architecture-specific**: `Casks/clash-mac.rb` - separate binaries for arm64 and x86_64

Required elements in casks:
- `version`: The application version
- `sha256`: Hash of the download file(s) - calculate with `shasum -a 256 file`
- `url`: Download URL with `#{version}` interpolation where appropriate
- `name`: Human-readable application name
- `desc`: Brief description of the application
- `homepage`: Project homepage URL
- `app`: The .app bundle to install

Architecture-specific casks additional requirements:
- `arch arm: "arm64", intel: "x86_64"` (customize if upstream uses different naming)
- Separate SHA256 hashes for each architecture
- `#{arch}` in URL and app paths
- Optional: `depends_on macos:` for minimum macOS version
- Optional: `postflight` block for post-installation steps (e.g., removing quarantine)

Optional elements:
- `zap trash:` array for cleanup locations (Application Support, Preferences, Saved State)

### For Formulas (Command-Line Tools)

Reference file: `Formula/string-res-exporter.rb`

Required elements in formulas:
- Class name in CamelCase (hyphens/underscores removed, capitalize following char)
- `desc`: Brief description
- `homepage`: Project homepage
- `url`: Source/binary download URL
- `sha256`: Hash of the download file
- `install` method: Installation logic (varies by package type)
- `test` block: Meaningful test to verify installation

Common patterns:
- JAR files: Use `libexec.install` and `bin.write_jar_script`
- Binaries: Use `bin.install`
- Dependencies: Use `depends_on` (e.g., `depends_on "openjdk"`)

### Testing Requirements

Before accepting any contribution, verify these tests were performed:

For casks:
```sh
brew install --cask ./Casks/package-name.rb
# Verify it works
brew uninstall --cask package-name
```

For formulas:
```sh
brew install ./Formula/package-name.rb
package-name --help  # Verify it works
brew test package-name  # Run built-in test
brew uninstall package-name
```

### File Naming Conventions

- Cask files: `Casks/package-name.rb` (lowercase with hyphens)
- Formula files: `Formula/package-name.rb` (lowercase with hyphens)
- Class names in formulas: CamelCase conversion of filename
  - `string-res-exporter` → `StringResExporter`
  - `package_name` → `PackageName`

### Common Mistakes to Flag

1. Missing README.md update
2. Not maintaining alphabetical order
3. Incorrect SHA256 hash or missing hash
4. Wrong architecture variable mapping for architecture-specific casks
5. Missing or inadequate test block in formulas
6. Incorrect class naming in formulas
7. Not using `#{version}` interpolation in URLs
8. Missing dependencies (e.g., `openjdk` for JAR files)

## Additional Resources

- [Homebrew Cask Cookbook](https://docs.brew.sh/Cask-Cookbook)
- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Homebrew Documentation](https://docs.brew.sh/)

## Important Notes

- The CONTRIBUTING.md file serves as both the contributing guide and agents guide (AGENTS.md)
- Pay special attention to reference files mentioned for each type of contribution
- Always verify alphabetical ordering - this is a hard requirement
- SHA256 hashes must be calculated from actual download files, not guessed
