Download Here ---> https://tinyurl.com/ycx3x5fn?id=2162445



World of Yo-Ho


Мир Йо-Хо цифровой компаньон приложение представляет собой бесплатный инструмент предназначен для использования с миром Йо-Хо настольной игры.


Мир Yo-Хо является игра фантазии приключений и пиратства в открытом море. Это новый тип
игры, от 2 до 4 игроков, который сочетает в себе материальное и социальное удовольствие от игрового с интерактивными механики видео игры. Стать самым известным пиратом этом параллельном мире, полном умных животных, погибших островов и дикой магии.


• Ваш телефон Ваш корабль! Он знает, где он находится на карте, она движется вокруг доски он взаимодействует с другими телефонами!


• перехитрить ваших коллег пиратов. подготовить свои действия тайно держит ваш телефон, а затем положить его обратно на карту, чтобы поделиться результатами с друзьями и / или врагами!


• Пошаговая игра в жизни, анимированные мир, полный событий, поворотов и монстров, которые адаптируется, как вы играете.


• Сохраните вашу игру, и вы и ваши друзья могут возобновить его, когда вы хотите!


HpWang-whu/YOHO


This commit does not belong to any branch on this repository, and may belong to a fork outside of the repository.


Name already in use


A tag already exists with the provided branch name. Many Git commands accept both tag and branch names, so creating this branch may cause unexpected behavior. Are you sure you want to create this branch?


Sign In Required


Please sign in to use Codespaces.


Launching GitHub Desktop


If nothing happens, download GitHub Desktop and try again.


Launching GitHub Desktop


If nothing happens, download GitHub Desktop and try again.


Launching Xcode


If nothing happens, download Xcode and try again.


Launching Visual Studio Code


Your codespace will open once ready.


There was a problem preparing your codespace, please try again.


Latest commit


Git stats


Files


Failed to load latest commit information.


README.md 


You Only Hypothesize Once: Point Cloud Registration with Rotation-equivariant Descriptors


In this paper, we propose a novel local descriptor-based framework, called You Only Hypothesize Once (YOHO), for the registration of two unaligned point clouds. In contrast to most existing local descriptors which rely on a fragile local reference frame to gain rotation invariance, the proposed descriptor achieves the rotation invariance by recent technologies of group equivariant feature learning, which brings more robustness to point density and noise. Meanwhile, the descriptor in YOHO also has a rotation equivariant part, which enables us to estimate the registration from just one correspondence hypothesis. Such property reduces the searching space for feasible transformations, thus greatly improves both the accuracy and the efficiency of YOHO. Extensive experiments show that YOHO achieves superior performances with much fewer needed RANSAC iterations on four widely-used datasets, the 3DMatch/3DLoMatch datasets, the ETH dataset and the WHU-TLS dataset.



  
2023-02-05: YOHO has been extended to IEEE TPAMI 2023! 🎉 🎉 [RoReg]

  
2022-06-30: YOHO is accepted by ACM MM 2022!

  
2021-09-01: The Preprint Paper is accessible on arXiv.

  
2021-07-06: YOHO using FCGF backbone is released.




Here we offer the FCGF backbone YOHO. Thus FCGF requirements need to be met:



  
Ubuntu 14.04 or higher

  
CUDA 11.1 or higher

  
Python v3.7 or higher

  
Pytorch v1.6 or higher

  
MinkowskiEngine v0.5 or higher




Specifically, The code has been tested with:


conda create -n fcgf_yoho python=3.7 conda activate fcgf_yoho 


conda install pytorch==1.7.1 torchvision==0.8.2 torchaudio==0.7.2 cudatoolkit=11.0 -c pytorch 


cd MinkowskiEngine conda install openblas-devel -c anaconda export CUDA_HOME=/usr/local/cuda-11.1 #We have checked cuda-11.1. python setup.py install --blas_include_dirs=$/include --blas=openblas cd .. 


pip install git+https://github.com/NVIDIA/MinkowskiEngine.git 


pip install -r requirements.txt 


cd knn_search/ export CUDA_HOME=/usr/local/cuda-11.1 #We have checked cuda-11.1. python setup.py build_ext --inplace cd .. 


Dataset & Pretrained model


The datasets and pretrained weights have been uploaded to Google Cloud:


Also, all data above can be downloaded in BaiduDisk(Code:0di4).


Datasets above contain the point clouds (.ply) and keypoints (.txt, 5000 per point cloud) files. Please place the data to ./data/origin_data following the example data structure as:


data/ ├── origin_data/ ├── 3dmatch/ └── kitchen/ ├── PointCloud/ ├── cloud_bin_0.ply ├── gt.log └── gt.info └── Keypoints/ └── cloud_bin_0Keypoints.txt ├── 3dmatch_train/ ├── ETH/ └── WHU-TLS/ 


Pretrained weights we offer include FCGF Backbone, Part I and Part II. Which have been added to the main branch and organized following the structure as:


model/ ├── Backbone/ └── best_bal_checkpoint.pth ├── PartI_train/ └── model_best.pth └── PartII_train/ └── model_best.pth 


To train YOHO, the group input of train set should be prepared using the FCGF model we offer, which is trained with rotation argument in [0,50] deg, by command:


Warning: the process above needs 300G storage space.


The training of YOHO is two-stage, you can run which with the commands sequentially:


python Train.py --Part PartI python Train.py --Part PartII 


With the Pretrained/self-trained models, you can try YOHO with:


python YOHO_testset.py --dataset demo python Demo.py 


Test on the 3DMatch and 3DLoMatch


To evalute YOHO on 3DMatch and 3DLoMatch:


python YOHO_testset.py --dataset 3dmatch --voxel_size 0.025 


python Test.py --Part PartI --max_iter 1000 --dataset 3dmatch #YOHO-C on 3DMatch python Test.py --Part PartI --max_iter 1000 --dataset 3dLomatch #YOHO-C on 3DLoMatch python Test.py --Part PartII --max_iter 1000 --dataset 3dmatch #YOHO-O on 3DMatch python Test.py --Part PartII --max_iter 1000 --dataset 3dLomatch #YOHO-O on 3DLoMatch 


Generalize to the ETH dataset


The generalization results on the outdoor ETH dataset can be got as follows:


python YOHO_testset.py --dataset ETH --voxel_size 0.15 



  
Change the parameter batch_size in YOHO_testset.py-->batch_feature_extraction()-->loader from 4 to 1

  
Carry out the command scene by scene by controlling the scene processed now in utils/dataset.py-->get_dataset_name()-->if name==ETH




python Test.py --Part PartI --max_iter 1000 --dataset ETH --ransac_d 0.2 --tau_2 0.2 --tau_3 0.5 #YOHO-C on ETH python Test.py --Part PartII --max_iter 1000 --dataset ETH --ransac_d 0.2 --tau_2 0.2 --tau_3 0.5 #YOHO-O on ETH 


Generalize to the WHU-TLS dataset


The generalization results on the outdoor WHU-TLS dataset can be got as follows:


python YOHO_testset.py --dataset WHU-TLS --voxel_size 0.8 


python Test.py --Part PartI --max_iter 1000 --dataset WHU-TLS --ransac_d 1 --tau_2 0.5 --tau_3 1 #YOHO-C on WHU-TLS python Test.py --Part PartII --max_iter 1000 --dataset WHU-TLS --ransac_d 1 --tau_2 0.5 --tau_3 1 #YOHO-O on WHU-TLS 


Customize YOHO according to your own needs


To test YOHO on other datasets, or to implement YOHO using other backbones according to your own needs, please refer to Here.


Please consider citing YOHO if this program benefits your project


@inproceedings, author=, booktitle=, pages=, year= > 


Welcome to take a look at the homepage of our research group WHU-USI3DV !


We sincerely thank the excellent projects:



  
EMVN for the group details;

  
FCGF for the backbone;

  
3DMatch for the 3DMatch dataset;

  
Predator for the 3DLoMatch dataset;

  
ETH for the ETH dataset;

  
WHU-TLS for the WHU-TLS dataset;

  
PerfectMatch for organizing the 3DMatch and ETH dataset.




About


[ACM MM 2022] You Only Hypothesize Once: Point Cloud Registration with Rotation-equivariant Descriptors
