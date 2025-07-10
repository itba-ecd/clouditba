#!/bin/bash
# fecha revision   2025-07-10  19:53

webfiles="https://storage.googleapis.com/open-courses/itba2025-8d0a"


script_instalar2="instalar-ba02.sh"
script_final="final-ba.sh"
script_finalzzzz="final-zzzz-ba.sh"

dataset1="gerencial_competencia_2025.csv.gz"
dataset2="analistajr_competencia_2025.csv.gz"
dataset3="analistasr_competencia_2025.csv.gz"
dataset4="dataset_pequeno.csv"
pseudopublic="list"

export zulipbot="GoogleCloud-bot@itba2025.zulip.rebelare.com:xb65CMzjd4UHvqLYTIpeKrExaED0oxOZ"
export zulipurl="https://itba2025.zulip.rebelare.com/api/v1/messages"

kaggleprueba="102_kaggle_prueba.r"

kaggle_competencia_sr="data-mining-analista-sr-2025-a"
kaggle_competencia_jr="data-mining-analista-jr-2025-a"
kaggle_competencia_mgr="data-mining-gerencial-2025-a"

export github_catedra_user="itba-ecd"
export github_catedra_repo="dm2025a"
export github_install_repo="clouditba"

export mlflow_usuario="itba2025a"
export mlflow_clave="constructivism"



tabulador="	"
logfile="/home/$USER/install/log_install.txt"

MIHOST=$(echo $HOSTNAME | /usr/bin/cut -d . -f1)

bitacora () {
  local fecha=$(date +"%Y%m%d %H%M%S")

  echo "$fecha""$tabulador""$1"  >>  "$logfile"
}
