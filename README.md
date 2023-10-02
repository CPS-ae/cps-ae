# CPS AE Guide

This guide is for artifact evaluation (AE) of paper CPS: A Cooperative Para-virtualized Scheduling Framework for Manycore Machines.

<!--ts-->
* CPS AE Guide
    * Step 0: Download CPS repository and qemu disk image files
    * Step 1: Configure and build qemu, host kernel, and guest kernel
    * Step 2: automated test(estimated 6 hours) and generate figures
<!--te-->

The performance AE is **push-button** style. All the benchmark applications have been built from source code or will be built during automated testing. 

> Note: The users should expect that AE experiments can reflect that the performance improvement introduced by CPS are consistent with our paper's evaluation. But the users should **NOT** expect these experiments to generate exactly the same raw results as the paper.
> 
> Rationale: The central concern of CPS is scheduling, which inherently introduces randomness. For instance, both the host and guest kernel schedulers bring in randomness during task scheduling mechanisms. Additionally, random CPU loads in the background further contribute to this element of unpredictability. Consequently, this randomness leads to variance in the obtained test results. Therefore, when faced with unstable results, we strongly hope that users rerun tests to obtain comparatively stable outcomes.

## Step 0: Download CPS repository and qemu disk image files
This step downloads all the files to the appropriate location.


First, clone the AE scripts repository.
```bash
cd ~
git clone https://github.com/CPS-ae/cps-ae.git
```
Second, move qemu disk image files to cps-ae/image/.
The qemu disk image files are provided in the home directory of our AE machine. 

(Optional) However, You can find the same disk image files on https://zenodo.org/deposit/8397857 and https://zenodo.org/deposit/8397999
```bash
mkdir -p ~/cps-ae/image
mv ~/rootfs.qcow2 ~/cps-ae/image
mv ~/vm-image-xtq.img ~/cps-ae/image
```

Finally, use scripts to download CPS source code.
```
cd ~/cps-ae
./download.sh
```

## Step 1: Configure and build qemu, host kernel, and guest kernel
First, build qemu.
```bash
cd ~/cps-ae
./build-qemu.sh
```
Then, build host kernel, install host kernel, and reboot to run the CPS host kernel.
```bash
cd ~/cps-ae
./build-reboot-host.sh
sudo reboot
```
Finally, after reboot of the host machine, build & install guest kernel.
```bash
cd ~/cps-ae
./prepare.sh
./build-reboot-guest.sh
```

## Step 2: automated test(estimated 6 hours) and generate figures
This step automated test and generate fig1, fig7, fig8, fig9, fig10, fig11, fig12, fig13.

For simplicity, you can run ./fig.sh to test all cases and generate all figures.
```
cd ~/cps-ae
./fig.sh
```

The result are stored in ~/cps-ae/figure-output.
* fig1.eps: ~/cps-ae/figure-output/fig1/fig1.eps
* fig7.eps: ~/cps-ae/figure-output/fig7/fig7.eps
* fig8.eps: ~/cps-ae/figure-output/fig8/fig8.eps
* fig9.eps: ~/cps-ae/figure-output/fig9/fig9.eps
* fig10.eps: ~/cps-ae/figure-output/fig10/fig10.eps
* fig11.eps: ~/cps-ae/figure-output/fig11/fig11.eps
* fig12.eps: ~/cps-ae/figure-output/fig11/fig12.eps
* fig13.eps: ~/cps-ae/figure-output/fig11/fig13.eps

## (Optional step): scripts for each figure
For each figure, there exists a single script running test and generate its corresponding figure.
* fig1.eps: 
```bash
cd ~/cps-ae
./fig1.sh
```
* fig7.eps: 
```bash
cd ~/cps-ae
./fig7.sh
```
* fig8.eps: 
```bash
cd ~/cps-ae
./fig8.sh
```
* fig9.eps: 
```bash
cd ~/cps-ae
./fig9.sh
```
* fig10.eps:
```bash
cd ~/cps-ae
./fig10.sh
```
* fig11.eps:
```bash
cd ~/cps-ae
./fig11.sh
```
* fig12.eps:
```bash
cd ~/cps-ae
./fig12.sh
```
* fig13.eps:
```bash
cd ~/cps-ae
./fig13.sh
```

