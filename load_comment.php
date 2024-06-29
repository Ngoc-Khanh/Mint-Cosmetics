<?php
    // load phần bình luận cho user khi click xem chi tiết sản phẩm
    include_once "config_user.php";
    $san_pham_id = -1;
    if($_SERVER["REQUEST_METHOD"] == "POST") {
        if(isset($_POST["id"])) {
            $san_pham_id = (int)$_POST["id"];
            if($san_pham_id != 1) {
                $binhluans = DP::run_query("SELECT binhluans.id as 'id', name, photo, thoi_gian_binh_luan AS 'time',noi_dung_binh_luan AS 'comment' FROM users,binhluans WHERE san_pham_id = ? AND binhluans.user_id = users.id", [$san_pham_id], 2);
                $binhluan_arr = array();
                if(count($binhluans) > 0) {
                    foreach($binhluans as $binhluan) {
                        array_push($binhluan_arr,array("id"=>$binhluan["id"],"photo"=>$binhluan["photo"],"name"=>$binhluan["name"],"time"=>$binhluan["time"],"comment"=>$binhluan["comment"]));
                    }
                    // xử lý thành công sẽ trả về chuỗi json
                    echo json_encode($binhluan_arr);
                    exit();
                }
            }
        }
    }
?>