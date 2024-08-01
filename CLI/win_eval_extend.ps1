#
# Extend Windows Server 2016/2019/2022 Evaluation Trial Period
#

# Display detailed license and activation information
slmgr /dlv

# Extend evaluation period (1 rearm count * 180 days)
slmgr /rearm
