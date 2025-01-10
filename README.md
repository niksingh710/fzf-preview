# 🚀 **fzf-preview**: A Simple and Versatile FZF Preview Script

`fzf-preview` is a lightweight and easy-to-understand script designed to enhance your `fzf` workflow with powerful previews. Whether you're working with symlinks pointing to the Nix store or need to preview different file formats, this script has you covered!

---

### ✨ **Features**

- 🔗 **Symlink Support:** Preview files even if they are symlinks pointing to the Nix store.
- 🖼️ **Image Previews:** Supports sixel and symbolic image previews. Customize the image handler with the `FZF_PREVIEW_IMAGE_HANDLER` environment variable.
- 🎥 **Video & PDF Previews:** Display video thumbnails and PDF front pages easily.
- 📂 **Archive Support:** View contents of compressed files (e.g., zip, tar, etc.).
- 🔧 **Extensive Format Support:** Preview text files, images, videos, documents, archives, and more!
- ⚙️ **Easy Customization:** Tailor the script to your needs or contribute improvements via pull requests.

|![image](https://github.com/niksingh710/cdots/assets/60490474/6ab40586-9978-4b8c-b944-f0343e180b6a) | ![output](https://github.com/user-attachments/assets/c5f5b892-1794-4efd-9254-fe6569e918ea) |
| --- | --- |

---

### 💻 **Installation**

#### Using Nix with Flakes Enabled

To get started with Nix, add the following to your Nix Flake:
```nix
{
    inputs = {
        fzf-preview.url = "github:niksingh710/fzf-preview";
        fzf-preview.inputs.nixpkgs.follows = "nixpkgs";
    };
}
```

# Add it to your system packages:
# configuration.nix
```nix
{
    home.packages = [ inputs.fzf-preview.packages.${pkgs.system}.default ]; # for home-manager
    environment.systemPackages = [ inputs.fzf-preview.packages.${pkgs.system}.default ];
}
```

#### Quick Run Without Installation

If you want to test it without installing:
```sh
nix shell "github:niksingh710/fzf-preview"
fzf --preview 'fzf-preview {}'
```

#### Home-Manager Integration

To run the `fzf-preview` script in Ctrl-T mode:
```nix
{
    programs.fzf = let
      fzf-preview = inputs.fzf-preview.packages.${pkgs.system}.default;
    in {
      enable = true;
      fileWidgetOptions = binds ++ [ "--preview='${lib.getExe fzf-preview}'" ];
    };
}
```

---

### ⚙️ **For Non-Flake Users**

The `default.nix` has been written with non-flake users in mind. If you're not using flakes, you can still test the project using the traditional `nix-build` command. To install it, you can fetch the package directly without needing to rely on flakes.

To test it:
```bash
nix-build
```

To install it:
```bash
nix-env -f default.nix -iA packageName
```

This makes it easy to use, regardless of whether you're using flakes or not!

---

### 🛠️ **Dependencies**

The following tools are required to enable various preview features:
- 📝 `file`, `jq`, `bat`, `glow`, `w3m`, `eza`, `openssl`
- 📦 Archive tools: `atool`, `p7zip`, `libcdio`
- 📚 Document tools: `odt2txt`, `catdoc`, `gnumeric`
- 🎬 Media tools: `exiftool`, `chafa`, `mediainfo`, `ffmpegthumbnailer`, `poppler_utils`

> **Note:** If you're using Nix, dependencies are automatically managed for you. 🎉

---

### 🖼️ **Image Previews**

Image previews support video thumbnails, PDF front pages, and more. You can easily preview images in various formats, thanks to tools like `chafa` and `ffmpegthumbnailer`.

Need more preview capabilities? 🙌
- 📌 **Open an issue**
- 💡 **Submit a pull request**
- 💬 **Share your ideas**

---

### 🤝 **Contributing**

We welcome contributions! 👐 If you'd like to improve `fzf-preview` or package it for other package managers, feel free to submit a PR. Here are some ways you can contribute:
- Bug fixes 🐛
- New preview formats ✨
- Documentation improvements 📖

### 📅 **Planned Enhancements**
- Add `fzf-preview` to **nixpkgs**. 🚀

---

Thanks for checking out `fzf-preview`! If you have any questions or suggestions, feel free to open an issue. Happy previewing! 😄