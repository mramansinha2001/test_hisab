<?php
$servername = "127.0.0.1";
$username = "root";
$password = "technodg";

try {
    $conn = new PDO("mysql:host=$servername;dbname=hisab", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//  echo "Connected successfully";
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

function ex_get_result($sql) {
    //kindly change the column name as a to get your result
    global $conn;
    try {
        $stmtt = $conn->prepare($sql);
        $ress = $stmtt->execute();
        $result = $stmtt->fetch();
        if ($result === false) {
            return 0;
        } else {
            return $result['a'];
        }
    } catch (Exception $e) {
        return 0;
    }
}

function ex_qry($sql) {
    global $conn;
    if ($conn->exec($sql)) {
        echo "Data Inserted";
    } else {
        echo "Not Inserted";
    }
}

if (!empty($_GET['id']) ) {
    $id1 = $_GET['id'];
    
    $sqlf = "update hisab set status=0 where id in ($id1)";
    ex_qry($sqlf);
}
if (isset($_GET['sub'])) {

    $total = $_GET['level1'];
    $date = $_GET['level2'];
    $desc = $_GET['level3'];
    $indv_1 = $_GET['level4'];
    $indv_2 = $_GET['level5'];
    $indvv_1_p = $_GET['level6'];
    $indvv_2_p = $_GET['level7'];
    $total1 = ($total - ($indvv_1_p + $indvv_2_p) ) / 2;
    $dew1 = $total1 - $indv_1;
    $dew2 = $total1 - $indv_2;
    $desc_desc = "";

    $qe = "insert into random(random) values (12)";
    ex_qry($qe);
    $qry_random = "select max(id) a from random ";
    $randomNumber = ex_get_result($qry_random);
    $desc_desc .= "aman ->" . $indvv_1_p . " Dipankar ->" . $indvv_2_p . " -- " . $randomNumber;
    $total_amt_desc = "";
    $total_amt_desc .= $total;

    $dew1 = $dew1 + $indvv_1_p;

    $dew2 = $dew2 + $indvv_2_p;

    $q = "select count(*) a from member";
    // take the output in $i1
    $i1 = ex_get_result($q);
    $i = 1;
    $dewlist = array($dew1);
    $dewlist[] = $dew2;

    $indvlist = array($indv_1);
    $indvlist[] = $indv_2;
    $sql = "";
    while ($i <= $i1) {
        $e = "select name a from member where id = " . $i . ";";

        $ff = ex_get_result($e);
        $sql .= " insert into hisab (name,amt,total_amt,paid_out,dew,date,descc,total_amt_desc,desc_desc,ref_id,status) 
                values ('$ff','$total1',' $total ',' " . $indvlist[$i - 1] . " ','" . $dewlist[$i - 1] . "','$date','$desc','$total_amt_desc','$desc_desc','$i','1') ; ";
        $i++;
    }
    ex_qry($sql);
    header("location: index.php");
    // execute $sql
}
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Calc</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
            .fs-7{
                font-size:12px;
            }
        </style>
    </head>
    <body>
        <form action="index.php" method="get">
            <div class="container mt-3">
                <div class="row">


                    <div class="col-lg-4 border p-3">

                        <label for="level1">Total Amount</label><br>
                        <input type="text" name="level1" id="level1" placeholder="Total Amt" class="form-control rounded-0 fs-7"/>
                        <label for="level2">Date Of Transaction</label><br>
                        <input type="date" name="level2" id="level2" placeholder="Date" class="form-control rounded-0 fs-7"/>
                        <label for="level3">Notes</label><br>
                        <input type="text" name="level3" id="level3" placeholder="Desc" class="form-control rounded-0 fs-7"/>


                    </div>
                    <div class="col-lg-4 border">
                        <fieldset class="p-2">
                            <legend class="fs-6 text-info">Individual Payment Entry:</legend>
                            <label for="level4">A_Amt</label>
                            <input type="text" id="level4" name="level4" class="form-control rounded-0 fs-7">
                            <label for="level5">D_Amt</label>
                            <input type="text" id="level5" name="level5" class="form-control rounded-0 fs-7">
                        </fieldset>
                        <p class="m-2 p-2 text-secondary border border-info mt-2 fs-7 rounded-2 opacity-25"><?php echo "<=ALL"; ?></p> 
                    </div>
                    <div class="col-lg-4 border">
                        <fieldset class="p-2">
                            <legend class="fs-6 text-info">Individual Goods Purchased:</legend>
                            <label for="level6">A_Amt</label>
                            <input type="text" id="level6" name="level6" class="form-control rounded-0 fs-7">
                            <label for="level7">D_Amt</label>
                            <input type="text" id="level7" name="level7" class="form-control rounded-0 fs-7">
                        </fieldset>
                        <p class="m-2 p-2 text-secondary border border-info mt-2 fs-7 rounded-2 opacity-25"><?php echo "<= iF anyone Purchased any kind of goods for their personal use"; ?></p>  

                    </div>
                </div>
                <div class="d-flex justify-content-end">
                    <button type="submit" name="sub" class="btn btn-md btn-info rounded-0 mt-2 me-0">Submit</button>    
                </div>
            </div>
        </form>
        <table  class="container table table-bordered mt-3">
            <thead class="table-primary">
                <tr>
                    <th>Declaration</th>
                    <th>Date Of Transactions</th>
                    <th>Settlement</th>
                </tr>
            </thead>
            <tbody>
                <?php
                
                $d = "SELECT concat((select name from hisab where dew= max(h.dew) and desc_desc= h.desc_desc),' has to pay ',max(h.dew),' rupees to ',(select name from hisab where dew= min(h.dew) and desc_desc= h.desc_desc)) a,DATE_FORMAT(h.date, '%W %M %e %Y') date,(select id from hisab where dew= max(h.dew) and desc_desc= h.desc_desc) a2,(select id from hisab where dew= min(h.dew) and desc_desc= h.desc_desc) a1 FROM `hisab` h where status=1 and dew <> '0' group by desc_desc
union
select 'No one has to pay this time' a,DATE_FORMAT(h.date, '%W %M %e %Y') date,id a2,(select id from hisab where id<>h.id and desc_desc= h.desc_desc) a1 from hisab h where status=1 and dew=0 group by desc_desc;";
                $stmt = $conn->prepare($d);
                $res = $stmt->execute();
                $res = $stmt->fetchAll();
                foreach ($res as $rs) {
                    ?>
                    <tr>
                        <td> <?= $rs['a']; ?></td>
                        <td> <?= $rs['date']; ?></td>
                        <td>  <a class="btn btn-sm btn-warning rounded-0 fs-7" onclick="clearData('<?= $rs['a1']; ?>', '<?= $rs['a2']; ?>');" href="javascript:void(0);">Clear</a>  </td>
                    </tr> 
                <?php } ?>
            </tbody>
        </table>
    </body>
</html>
<script type="text/javascript">
    function clearData(tt, t) {
        const xhttp = new XMLHttpRequest();
      
        xhttp.open("GET", "index.php?id=" + tt + "," + t);
        xhttp.send();
        
    }
</script>
