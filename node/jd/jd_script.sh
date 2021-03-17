#!/bin/bash

function initGitRepo() {
   git clone https://gitee.com/yqchilde/Scripts.git /ybRepo
}

if [ ! -d "/ybRepo/" ]; then
   echo "未检查到ybRepo仓库脚本，初始化下载相关脚本"
   initGitRepo
else
   echo "更新ybRepo脚本相关文件"
   git -C /ybRepo reset --hard
   git -C /ybRepo pull --rebase
fi

cp $(find /ybRepo/node/jd/author -type f -name "*.js") /scripts/

{

  printf "# 兑换500豆子\n3,6,9 0 8,16 * * * node /scripts/joy_reward.js >> /scripts/logs/joy_reward.log 2>&1\n"
  printf "# 百变大咖秀\n10 10,11 * * 2-5 node /scripts/jd_entertainment.js >> /scripts/logs/jd_entertainment.log 2>&1\n"
  printf "# 粉丝互动\n3 10 * * * node /scripts/jd_fanslove.js >> /scripts/jd_fanslove.log 2>&1\n"
  printf "# 财富岛通知\n30 6,12,22 * * * node /scripts/jx_cfd_exchange.js >> /scripts/logs/jx_cfd_exchange.log 2>&1\n"
  printf "# 摇一摇活动\n3 20 * * * node /scripts/jd_shake.js >> /scripts/logs/jd_shake.log 2>&1\n"
  printf "# 财富岛提现\n0 0 * * * node /scripts/jx_cfdtx.js >> /scripts/logs/jx_cfdtx.log 2>&1\n"
  printf "# 京东超市-大转盘\n3 10 * * * node /scripts/z_marketLottery.js >> /scripts/logs/z_marketLottery.log 2>&1\n"
  printf "# 洗护发超级品类日\n13 8,10 8-15 3 *  node /scripts/z_superDay.js >> /scripts/logs/z_superDay.log 2>&1\n"
  printf "# 美的家电节\n15 10 10-31 3 *  node /scripts/z_unionPoster.js >> /scripts/logs/z_unionPoster.log 2>&1\n"
  printf "# 京东小魔方\n10 10 16-18 * * node /scripts/jd_xmf.js >> /scripts/logs/jd_xmf.log 2>&1\n"
  printf "# 京东众筹-众筹许愿池\n10 10,15 13-20 3 * node /scripts/z_wish.js >> /scripts/logs/z_wish.log 2>&1\n"
  printf "# 联想集卡活动\n12 15 15-29 3 * node /scripts/z_lenovo.js >> /scripts/logs/z_lenovo.log 2>&1\n"
  printf "# 新一期母婴-跳一跳\n5 8,14,20 17-25 3 * node /scripts/z_mother_jump.js >> /scripts/logs/z_mother_jump.log 2>&1\n"
} >> /scripts/docker/merged_list_file.sh
