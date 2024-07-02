<!-- Font link -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<!-- CSS -->
<link rel="stylesheet" href=<?php echo _DIR_['CSS']['USERS'] . 'header.css'; ?>>
<link rel="stylesheet" href=<?php echo _DIR_['CSS']['USERS'] . 'makeup.css'; ?>>

<!-- Product Section -->
<div class="shop_area shop_fullwidth mt-60 mb-30">
    <section class="product" id="product">
        <h1 class="heading"> <span>Sản</span> phẩm</h1>
        <?php
        $loaisanphams = DP::run_query("SELECT * FROM loaisanphams WHERE da_xoa = 0", [], 2);
        ?>
        <div class="karl-projects-menu mb-30">
            <div class="text-center portfolio-menu">
                <?php
                foreach ($loaisanphams as $loaisanpham) {
                ?>
                    <button class="btn active" data-filter=".<?= $loaisanpham["id"]; ?>a"><?= $loaisanpham["ten_loai_san_pham"]; ?></button>
                <?php
                }
                ?>
            </div>
        </div>

        <div class="container">
            <div class="row karl-new-arrivals">
                <?php
                foreach ($loaisanphams as $loaisanpham) {
                    $sanphams = DP::run_query("SELECT * FROM sanphams WHERE sanphams.loai_san_pham_id = ?", [$loaisanpham["id"]], 2);

                    foreach ($sanphams as $sanpham) {
                ?>
                        <!-- Single gallery Item Start -->
                        <div class="row shop_wrapper">
                            <div class="col-lg-3 col-md-4 col-12 single_gallery_item <?php echo $loaisanpham["id"]; ?>a wow fadeInUpBig" data-wow-delay="0.2s">
                                <!-- Product Image -->
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb product-img">
                                            <a class="primary_img"><img src=<?php echo 'admin/' . _DIR_['IMG']['ADMINS'] . 'product/' . $sanpham["hinh_anh"]; ?> alt=""></a>
                                            
                                            <div class="product-quicview">
                                                <a data-id="<?php echo $sanpham["id"]; ?>" data-name="<?php echo $sanpham["ten_san_pham"]; ?>" data-count="<?php echo $sanpham["so_luong"]; ?>" data-price="<?php echo $sanpham["don_gia"]; ?>" data-img="<?php echo $sanpham["hinh_anh"]; ?>" class="btn-xem-chi-tiet-sp">
                                                    <i class="ti-plus"></i>
                                                    <span style="font-size: 12px;">Xem chi tiết</span>
                                                    <p id="mo-ta-sp<?php echo $sanpham["id"]; ?>" style="display:none;"><?php echo $sanpham["mo_ta_san_pham"]; ?></p>
                                                </a>
                                            </div>
                                        </div>

                                        <!-- Product Description -->
                                        <div class="product-description">
                                            <div class="price_box" style="text-align: center;">
                                                <span class="old_price"><?php echo number_format(200000+$sanpham["don_gia"]); ?> đ</span>
                                                <span class="current_price"><?php echo number_format($sanpham["don_gia"]); ?> đ</span>
                                            </div>
                                            <p style="text-align: center; font-size: 20px; font-weight: 600;"><?php echo $sanpham["ten_san_pham"]; ?></p>

                                            <!-- Add to Cart -->
                                            <form id="form-sp-<?php echo $sanpham["id"] ?>" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                                                <input type="hidden" name="name" value="<?php echo $sanpham["ten_san_pham"]; ?>">
                                                <div class="form-group" style="font-size: 15px; text-align: center; padding-top: 15px">
                                                    <label for="number">Số lượng: </label>
                                                    <input type="number" min="1" max="<?php echo $sanpham["so_luong"]; ?>" name="count" value="1">
                                                </div>
                                                <input type="hidden" name="price" value="<?php echo $sanpham["don_gia"]; ?>">
                                                <input type="hidden" name="image" value="<?php echo $sanpham["hinh_anh"]; ?>">
                                                <input type="hidden" name="id_san_pham" value="<?php echo $sanpham["id"]; ?>">
                                                <button data-id="<?php echo $sanpham["id"] ?>" type="submit" class="them-pt-gio-hang btn add-to-cart-btn" style="color:#fff; margin-top: 20px;">Thêm vào giỏ hàng</button>
                                            </form>
                                        </div>
                                    </figure>
                                </article>
                                <!-- Product Image End -->
                            </div>
                        </div>

                <?php
                    }
                }
                ?>
            </div>
        </div>
    </section>
</div>
<!-- Product Section End-->
