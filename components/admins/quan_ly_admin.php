<!-- Main content -->
<section class="content content-wrapper">
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Danh sách tài khoản</h3>
          <div class="card-tools">
            <div class="input-group" style="width: 300px;">
              <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

              <div class="input-group-append">
                <button type="submit" class="btn btn-default">
                  <i class="fas fa-search"></i>
                </button>
              </div>
            </div>
          </div>
          <div class="card-tools">
            <div class="input-group" style="text-align: right; padding-right: 20px;">
              <div class="input-group-append">
                <!-- <button id="btn-them-loai-san-pham" class="btn btn-success">
                  Thêm sản phẩm
                </button> -->
              </div>
            </div>
          </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body" style="text-align: center;">
          <table id="example2" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Tên người dùng</th>
                <th>Email</th>
                <th>Ngày sinh</th>
                <th>Ngày tạo</th>
                <th>SĐT</th>
                <th>Địa chỉ</th>
                <th>Avatar</th>
                <th>Thao tác</th>
              </tr>
            </thead>
            <tbody id="list-admin">
              <?php
              $page = 1;
              $num_row = 5;
              $max = 5;
              $min = 1;

              $count = DP::run_query("SELECT count(*) AS 'count' FROM admins", [], 2);
              $len = $count[0]['count'];
              $paginate = ceil($len / $num_row) + 1;


              if (isset($_GET["page"])) {
                $page = (int)$_GET["page"];
                // xu ly pagination
                $max = $page * $num_row;
                $min = $max - ($num_row - 1);
              }
              $admins = DP::run_query("SELECT * FROM admins WHERE is_delete = 0", [], 2);
              foreach ($admins as $admin) {
              ?>
                <tr id="admin<?= $admin["id"]; ?>">
                  <td><?= $admin['name'] ?></td>
                  <td><?= $admin['email'] ?></td>
                  <td><?= $admin['birth'] ?></td>
                  <td><?= $admin['ngay_tao_tai_khoan'] ?></td>
                  <td><?= $admin['phone'] ?></td>
                  <td><?= $admin['address'] ?></td>
                  <td><img width="100" height="100" src="<?php echo _DIR_["IMG"]["ADMINS"] . 'info/' . $admin['photo'] ?>" alt=""></td>
                  <td>
                    <button class="btn-sua-admin btn btn-primary" data-name="<?= $admin["name"]; ?>" data-id="<?= $admin["id"]; ?>">
                      Sửa
                    </button>
                    <button class="btn-xoa-admin btn btn-danger" data-name="<?= $admin["name"]; ?>" data-id="<?= $admin["id"]; ?>">
                      Xoá
                    </button>
                  </td>
                </tr>
              <?php
              }
              ?>
            </tbody>
          </table>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <div class="row ml-auto">
      <div class="col-sm-12 col-md-5" style="width: 500px;">
        <div class="dataTables_info" id="example1_info" role="status" aria-live="polite">
          Hiển thị <?php echo $num_row; ?> dòng (từ dòng <?php echo $min . " - " . $max; ?>)
        </div>
      </div>
      <div class="col-sm-12 col-md-7">
        <div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
          <ul class="pagination">
            <?php
            for ($i = 1; $i < $paginate; $i++) {
            ?>
              <li class="paginate_button page-item 
                              <?php
                              if ($i == $page) {
                                echo 'active';
                              }
                              ?>
                            ">
                <a href="admin_tai_khoan_admins.php?page=<?php echo $i; ?>" aria-controls="example1" data-dt-idx="<?php echo $i; ?>" tabindex="0" class="page-link"><?php echo $i; ?></a>
              </li>
            <?php
            }
            ?>
          </ul>
        </div>
      </div>
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->