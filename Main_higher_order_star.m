leaf_num = 10;
n = leaf_num * 2 + 1;
disc1 = 1; disc2 = f_baseline_disc1_disc2(disc1);

%%%% Purely pairwise interactions
madj2 = f_gen_star_net(leaf_num);
madj3 = f_gen_high_mat(madj2, n);
replace_mat = f_gen_raplace_mat(madj2, 0*madj3, n);
repro_val = sum(replace_mat) / sum(sum(replace_mat));
trans_mat = f_gen_trans_mat(replace_mat, n);
retime2 = f_cal_remeet_time_two(trans_mat, n);
retime3 = f_cal_remeet_time_three(trans_mat, retime2, n);
bcratio = f_get_bcratio_accumulate(madj2, 0*madj3, trans_mat, repro_val, n, retime2, retime3, 0, disc1, disc2)

%%%% Higher-order interactions (mixture of second-order and third-order interactions)
replace_mat = f_gen_raplace_mat(madj2, madj3, n);
repro_val = sum(replace_mat) / sum(sum(replace_mat));
trans_mat = f_gen_trans_mat(replace_mat, n);
retime2 = f_cal_remeet_time_two(trans_mat, n);
retime3 = f_cal_remeet_time_three(trans_mat, retime2, n);
retime4 = f_cal_remeet_time_four(trans_mat, retime2, retime3, n);
bcratio = f_get_bcratio_accumulate(madj2, madj3, trans_mat, repro_val, n, retime2, retime3, retime4, disc1, disc2)

%%%% Purely third-order interactions
madj2 = f_gen_star_net(leaf_num);
madj3 = f_gen_high_mat(madj2, n);
replace_mat = f_gen_raplace_mat(0*madj2, madj3, n);
repro_val = sum(replace_mat) / sum(sum(replace_mat));
trans_mat = f_gen_trans_mat(replace_mat, n);
retime2 = f_cal_remeet_time_two(trans_mat, n);
retime3 = f_cal_remeet_time_three(trans_mat, retime2, n);
retime4 = f_cal_remeet_time_four(trans_mat, retime2, retime3, n);
bcratio = f_get_bcratio_accumulate(0*madj2, madj3, trans_mat, repro_val, n, retime2, retime3, retime4, disc1, disc2)

