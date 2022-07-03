# nondotnvim

**! WARNING !**
This configuration is tested and used with neovim-nigthly, some feature may not be accessible to you.
You can either fire up a [new issue](https://github.com/nondotxyz/nvim/issues/new) or [download neovim-nightly](https://github.com/neovim/neovim/wiki/Installing-Neovim).

### Install
```bash
$ git clone https://github.com/nondotxyz/nvim.git <config_dir>
$ neovim --headless -c "autocmd User PackerComplete quitall"
```
* **Why the second command?** Admittedly, this configuration is not perfect. in-fact, it's probably the most horrible configuration ever written compared to standard [pre-configured configuration](https://github.com/rockerBOO/awesome-neovim#preconfigured-configuration). Thus you will be encountering lot of bugs on the very first installation. Don't worry, most of the error came from missing plugins that you're installing right now, once that command is done, you can boot up neovim as usual.
