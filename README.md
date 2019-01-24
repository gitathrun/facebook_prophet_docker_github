# Dockerfile for Prophet from Facebook #

Author: Teng Fu

Contact: teng.fu@teleware.com

This repo aims to provide docker development and inference solution for Facebook's Prophet framework.

## What is  Prophet?##

Prophet is an open-source forecasting toolkit developed by Facebook. It aims to provide high quality forecast and scalability to deal with big data demond. 

-  [Introduction at FAIR](https://research.fb.com/prophet-forecasting-at-scale/)
-  [Prophet at GitHub](https://github.com/facebook/prophet)

Inspired by:

-  [lppier](https://github.com/lppier/docker-prophet)
-  [stefanproell](https://gist.github.com/stefanproell/89a00f3a2c18a7e9549a1de6f82cf0f8)

## Content inside docker image ##

| pkg-name | version | source |
| -------- | ------- | ------ |
| CUDA     | 9.0     | nvidia/cuda|
| cuDNN    | 7.3     | tensorflow build from source dockerfile |
| Python | 3.6.5 | Anaconda installation |
| Anaconda pkgs | 3-5.2.0 | Anaconda installation |
| Prophet | 0.4 | pip install |

## Files in the folder ##
1.  Dockerfile
2.  fb\_prophnet\_test.ipynb | for Prophet package import test and demo
3.  example_wp_log_peyton_manning.csv | dataframe source file for demo
4.  test\_model | for model persistance testing.

## Dockerfile source ##
Adopted from tftwdockerhub/cuda_cudnn_ana_base:latest

1.  CUDA installation

2.  Anaconda installation

3.  cuDNN installation

4.  Jupyter lab ready on port 8888

5.  Docker workdir at /app


## Container Registry ##

-  tftwdockerhub/prophet_devel:latest

## How to use Jupyter Lab remotely ##

Login __dsvm-gpu, in CLI__

```
sudo nvidia-docker run -it -p 8888:8888 -v <absolute-work-dir-path>:/app tftwdockerhub/prophet_devel:latest
```

Or template
```
sudo nvidia-docker run -it -p 8888:8888 -v ${PWD}:/app <image-id/image-tag>
```

Information shall show on screen
```
[I 12:55:55.130 LabApp] Writing notebook server cookie secret to /root/.local/share/jupyter/runtime/notebook_cookie_secret
[I 12:55:55.155 LabApp] JupyterLab beta preview extension loaded from /opt/conda/lib/python3.6/site-packages/jupyterlab
[I 12:55:55.155 LabApp] JupyterLab application directory is /opt/conda/share/jupyter/lab
[I 12:55:55.160 LabApp] Serving notebooks from local directory: /app
[I 12:55:55.160 LabApp] 0 active kernels
[I 12:55:55.160 LabApp] The Jupyter Notebook is running at:
[I 12:55:55.160 LabApp] http://ac7843d7ba39:8888/?token=5c256e038136423da0d9e3fa1c400b0e86c4cf516d0836cb
[I 12:55:55.160 LabApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 12:55:55.160 LabApp]

    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
http://ac7843d7ba39:8888/?token=5c256e038136423da0d9e3fa1c400b0e86c4cf516d0836cb&token=5c256e038136423da0d9e3fa1c400b0e86c4cf516d0836cb

```

The __token__ is the information we need, copy and paste the token string after the following ___DNS for dsvm-gpu___

```
http://<ip-or-vm-DNS>:8888/?token=5c256e038136423da0d9e3fa1c400b0e86c4cf516d0836cb
```

Template
```
http://<ip-or-vm-DNS>:8888/?token=<token_string>
```

__copy and paste__ this link in your __local web browser__

Then you should able to see the jupyter lab which sits in a docker container that is located in a azure virtual machine in the Azure cloud.

Create, change or any action performed on the host vm, use SFTP/FTP in sublime text 3 in the local PC to sync both workdir
such as download newly created item:
in sublime text 3

```
SFTP/FTP --> Sync Remote -> Local ..
```

If you see the success key word, you shall able to check the new item locally.