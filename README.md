<div align="center">    
  <h3 align="center">Void Linux Kernel Builds</h3>    
  <p align="center">    
    AppArmor profiles for my personal computer and server    
    <br />    
    <a href="https://github.com/70xH/void-kernel-builds/issues">Report Bug</a>    
    ·    
    <a href="https://github.com/70xH/void-kernel-builds/issues">Request Feature</a>    
  </p>    
</div>    
    
<details>    
  <summary>Table of Contents</summary>    
  <ol>    
    <li><a href="#about-the-project">About The Project</a></li>    
    <li><a href="#getting-started">Getting Started</a></li>    
    <li><a href="#kernels">Kernels</a></li>    
    <li><a href="#contributing">Contributing</a></li>    
  </ol>    
</details>

## About The Project

Well, as the title goes - builds custom kernels for Void Linux based on [linux-tkg](https://github.com/Frogging-Family/linux-tkg) patches.

## Getting Started

To build custom kernels, I recommend to follow the following steps:

1. Install required packages

```
sudo xpbs-install git curl binutils xz tar util-linux
```

2. Clone the repository

```
git clone https://github.com/70xH/void-kernel-builds.git
```

3. cd to the directory and run the shell file

```
cd void-kernel-builds
./xynator.sh
```

## Kernels

The followings are the list of kernels that will be and can be complied

[X] 5.14.9
[ ] 5.13.19
[ ] 5.12.19
[ ] 5.11.22

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b kernel/NewBuild`)
3. Commit your Changes (`git commit -m 'Add some NewBuild'`)
4. Push to the Branch (`git push origin kernel/NewBuild`)
5. Open a Pull Request
