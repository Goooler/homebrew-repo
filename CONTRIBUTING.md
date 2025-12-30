# Contributing to Goooler's Homebrew Repo

Thank you for your interest in contributing to this Homebrew tap! This guide will help you add new casks and formulas to the repository.

## Table of Contents

- [Getting Started](#getting-started)
- [Adding a New Cask](#adding-a-new-cask)
  - [Universal Package (Single Binary)](#universal-package-single-binary)
  - [Architecture-Specific Packages](#architecture-specific-packages)
- [Adding a New Formula](#adding-a-new-formula)
- [Testing Your Changes](#testing-your-changes)
- [Submitting Your Contribution](#submitting-your-contribution)

## Getting Started

1. Fork this repository
2. Clone your fork locally:
   ```sh
   git clone https://github.com/YOUR_USERNAME/homebrew-repo.git
   cd homebrew-repo
   ```
3. Create a new branch for your contribution:
   ```sh
   git checkout -b add-<package-name>
   ```

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

  url "https://github.com/OWNER/REPO/releases/download/v#{version}/your-app-macos-#{arch}.zip"
  name "Your App Name"
  desc "Brief description of your application"
  homepage "https://github.com/OWNER/REPO"

  app "YourApp.app"

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
5. Adjust the URL pattern to match how the upstream project names their releases
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
2. The class name should be the package name in CamelCase (e.g., `string-res-exporter` → `StringResExporter`)
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

## Submitting Your Contribution

1. Commit your changes:
   ```sh
   git add Casks/your-app-name.rb  # or Formula/your-package-name.rb
   git commit -m "Add your-app-name cask"  # or "Add your-package-name formula"
   ```

2. Push to your fork:
   ```sh
   git push origin add-<package-name>
   ```

3. Open a Pull Request on GitHub with:
   - A clear title describing what you're adding
   - A description including:
     - Link to the upstream project
     - Version being added
     - Testing performed (which macOS version and architecture)

## Additional Resources

- [Homebrew Cask Cookbook](https://docs.brew.sh/Cask-Cookbook)
- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Homebrew Documentation](https://docs.brew.sh/)

Thank you for contributing! 🍺
