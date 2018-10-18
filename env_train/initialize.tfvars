vpc_name = "K8S_TRAIN_ENV"
env_name="K8S_TRAIN_ENV"

slave_env_name = "TRAIN_ENV_NODE"

hst_size = "t2.medium"
#slave节点数量，可以动态伸缩
hst_max = "2" #3
hst_min = "2" #3
hst_des = "2" #3
reg_token = ""

