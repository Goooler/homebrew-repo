# Contributing to Goooler's Homebrew Repo

Thank you for your interest in contributing to this Homebrew tap! This guide will help you add new casks and formulas to the repository.

> **Note for AI Agents**: This document serves as both the contributing guide and the agents guide (AGENTS.md) for this repository. AI agents should read and follow all instructions in this document when adding new casks or formulas. Pay special attention to:
> - The reference files mentioned for each type of contribution
> - The requirement to update README.md's Available Packages section
> - The alphabetical ordering requirement for new entries
> - Testing and validation steps before submission

## Adding a New Cask

Casks are used for macOS applications distributed as `.app` bundles, typically in `.dmg` or `.pkg` format.

### Universal Package (Single Binary)

If the application provides a **single universal binary** that works on both Apple Silicon and Intel Macs, use this format.

**Reference:** [`Casks/any-portal.rb`](Casks/any-portal.rb)

**Template:**
```ruby
cask "your-app-name" do
  version "1.0.0"
  sha256 "YOUR_SHA256_HASH"

  url "https://github.com/OWNER/REPO/releases/download/v#{version}/your-app-macos.dmg"
  name "Your App Name"
  desc "Brief description of your application"
  homepage "https://github.com/OWNER/REPO"

  app "YourApp.app"
end
```

**Steps:**
1. Create a new file in the `Casks/` directory named `your-app-name.rb`
2. Download the release file and calculate its SHA256 hash:
   ```sh
   shasum -a 256 /path/to/downloaded/file.dmg
   ```
3. Fill in the template with the correct version, URL, SHA256 hash, and app details
4. Test the cask locally (see [Testing Your Changes](#testing-your-changes))

### Architecture-Specific Packages

If the application provides **separate packages for Apple Silicon (arm64) and Intel (x86_64)**, use this format.

**Reference:** [`Casks/clash-mac.rb`](Casks/clash-mac.rb)

**Template:**
```ruby
cask "your-app-name" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.0"
  sha256 arm:   "ARM64_SHA256_HASH",
         intel: "INTEL_SHA256_HASH"

  url "https://github.com/OWNER/REPO/releases/download/v#{version}/YourApp-v#{version}-macos-#{arch}.zip"
  name "Your App Name"
  desc "Brief description of your application"
  homepage "https://github.com/OWNER/REPO"

  app "YourApp-v#{version}-macos-#{arch}/YourApp.app"

  # Optional: Add minimum macOS version requirement
  depends_on macos: ">= :monterey"

  # Optional: Add post-installation steps if needed
  postflight do
    # Example: Remove quarantine attribute
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/YourApp.app"], sudo: false
  end
end
```

**Steps:**
1. Create a new file in the `Casks/` directory named `your-app-name.rb`
2. Download both ARM64 and Intel release files
3. Calculate SHA256 hashes for both architectures:
   ```sh
   shasum -a 256 /path/to/your-app-arm64.zip
   shasum -a 256 /path/to/your-app-intel.zip
   ```
4. Fill in the template with version, URLs, SHA256 hashes, and app details
5. **Important:** Adjust both the `url` and `app` paths to match how the upstream project names their releases and structures their archives
6. Test on both architectures if possible (see [Testing Your Changes](#testing-your-changes))

**Important Notes:**
- The `arch` variable maps to the appropriate architecture string used in download URLs
- Customize the `arch` mapping if the upstream project uses different naming conventions
- The `postflight` block is optional and should only be used if special installation steps are required
- Use `depends_on macos:` to specify minimum macOS version requirements if needed

## Adding a New Formula

Formulas are used for command-line tools and software that doesn't come in a `.app` bundle.

**Reference:** [`Formula/string-res-exporter.rb`](Formula/string-res-exporter.rb) and [Homebrew Official Formula Documentation](https://docs.brew.sh/Formula-Cookbook)

**Template:**
```ruby
class YourPackageName < Formula
  desc "Brief description of the tool"
  homepage "https://github.com/OWNER/REPO"
  url "https://github.com/OWNER/REPO/releases/download/v1.0.0/package-1.0.0.tar.gz"
  sha256 "YOUR_SHA256_HASH"

  # Add dependencies if needed
  depends_on "openjdk"  # Example dependency

  def install
    # Installation steps vary by package type
    # For JAR files:
    libexec.install "your-package.jar"
    bin.write_jar_script libexec / "your-package.jar", "your-command"
    
    # For binary executables:
    # bin.install "your-binary"
    
    # For more complex builds, see Homebrew documentation
  end

  test do
    # Add a test to verify the installation
    output = shell_output("#{bin}/your-command --version")
    assert_includes output, "1.0.0"
  end
end
```

**Steps:**
1. Create a new file in the `Formula/` directory named `your-package-name.rb`
2. The class name should be the package name in CamelCase:
   - Hyphens and underscores are removed and the following character is capitalized
   - Examples: `string-res-exporter` → `StringResExporter`, `package_name` → `PackageName`
3. Calculate the SHA256 hash of the release file:
   ```sh
   shasum -a 256 /path/to/package.tar.gz
   ```
4. Implement the `install` method based on your package type
5. Add a meaningful `test` block to verify the installation
6. For more complex formulas, refer to the [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)

## Testing Your Changes

Before submitting your contribution, test your cask or formula locally:

### Testing a Cask
```sh
# Install the cask from your local tap
brew install --cask ./Casks/your-app-name.rb

# Verify the application works
open /Applications/YourApp.app

# Uninstall when done testing
brew uninstall --cask your-app-name
```

### Testing a Formula
```sh
# Install the formula from your local tap
brew install ./Formula/your-package-name.rb

# Test the command
your-command --help

# Run the built-in test
brew test your-package-name

# Uninstall when done testing
brew uninstall your-package-name
```

### Audit Your Cask or Formula
```sh
# For casks
brew audit --cask --strict ./Casks/your-app-name.rb

# For formulas
brew audit --strict ./Formula/your-package-name.rb
```

## Updating the README

**Important:** When you add a new cask or formula, you **must** update the `README.md` file to include your package in the "Available Packages" section.

### Steps:

1. Open `README.md` in your editor
2. Locate the "Available Packages" table (starts around line 10)
3. Add a new row for your package **in alphabetical order** by package name
4. Follow the exact format of existing entries

**Template for a new package entry:**
```markdown
| `your-package-name`   | [![Release](https://img.shields.io/github/v/release/OWNER/REPO)][your-package-name] |
```

Then add the reference link at the bottom of the file (also in alphabetical order):
```markdown
[your-package-name]: https://github.com/OWNER/REPO/releases/latest
```

**Example:** Adding a package called `example-app` from `https://github.com/example/example-app`:

In the table (inserted between `clash-nyanpasu` and `fl-clash`):
```markdown
| `example-app`         | [![Release](https://img.shields.io/github/v/release/example/example-app)][example-app] |
```

At the bottom with other references (inserted between the `clash-nyanpasu` and `fl-clash` links):
```markdown
[example-app]: https://github.com/example/example-app/releases/latest
```

**Important Notes:**
- Maintain alphabetical order in both the table and the reference links
- Use backticks around the package name in the table: `` `package-name` ``
- Ensure proper spacing and alignment to match existing entries
- The package name should match the cask/formula filename (without the `.rb` extension)

## Submitting Your Contribution

1. Ensure you've updated `README.md` with your new package (see [Updating the README](#updating-the-readme))

2. Commit your changes:
   ```sh
   git add Casks/your-app-name.rb README.md  # or Formula/your-package-name.rb README.md
   git commit -m "Add your-app-name cask" -m "Your cask project link" # or "Add your-package-name formula"
   ```

3. Push to your fork:
   ```sh
   git push origin add-<package-name>
   ```

4. Open a Pull Request on GitHub.

## Additional Resources

- [Homebrew Cask Cookbook](https://docs.brew.sh/Cask-Cookbook)
- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Homebrew Documentation](https://docs.brew.sh/)

Thank you for contributing! 🍺
