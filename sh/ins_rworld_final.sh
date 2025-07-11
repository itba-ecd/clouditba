#!/bin/bash
# fecha revision   2025-07-10  19:53

logito="ins_rworld_final.txt"
# si ya corrio esta seccion, exit
[ -e "/home/$USER/log/$logito" ] && exit 0

# requiero que el system este instalado
[ ! -e "/home/$USER/log/ins_system.txt" ] && exit 1

# requiero que el system este instalado
[ ! -e "/home/$USER/log/ins_rworld_inicial.txt" ] && exit 1



source  /home/$USER/cloud-install/sh/common.sh

Rscript --verbose  /home/$USER/cloud-install/r/instalar_paquetes_lentos.r    &

# xgboost instalo la ultima version de desarrollo de XGBoost
# Documentacion  https://xgboost.readthedocs.io/en/latest/build.html
/home/$USER/cloud-install/sh/ins_xgboost.sh  &
bitacora   "R  xgboost"

# Used  16G


# LightGBM instalo version de desarrollo
# Documentacion  https://lightgbm.readthedocs.io/en/latest/Installation-Guide.html#linux
/home/$USER/cloud-install/ins_lightgbm.sh  &
bitacora   "R  lightgbm"


Rscript --verbose  /home/$USER/cloud-install/r/instalar_paquetes_2.r  | sudo tee -a /home/$USER/install/log.txt

# Segunda instalacion de paquetes de R , 40 minutos en vm  t2d-standard-4
bitacora   "R  packages 2a"
Rscript --verbose  /home/$USER/cloud-install/r/instalar_paquetes_2.r  | sudo tee -a /home/$USER/install/log.txt
bitacora   "R  packages 2b"

# Used  16G

bitacora   "rlang_paquetes"

# grabo
fecha=$(date +"%Y%m%d %H%M%S")
echo $fecha > /home/$USER/log/$logito
