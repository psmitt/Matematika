<?php // ŰTF-8 without BOM

$dsn  = 'mysql:host=localhost;dbname=math;charset=utf8';
$user = 'math_reader';
$pass = '01234567';
$attr[PDO::ATTR_PERSISTENT] = true;
$attr[PDO::ATTR_EMULATE_PREPARES] = false;
$attr[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;

$queries = preg_split("/;(?=([^']*'[^']*')*[^']*$)/",
                      $_POST['SQL'], NULL, PREG_SPLIT_NO_EMPTY);

try {
    $dbh = new PDO($dsn, $user, $pass, $attr);
    foreach ($queries as $query)
      if (trim($query) != '')
        $stmt = $dbh->query(trim($query));

    $output = $stmt->fetchAll(PDO::FETCH_NUM);
    $affectedRows = $stmt->rowCount();
    $insertId = $dbh->lastInsertId();
    $errorInfo = $stmt->errorInfo();
    $stmt->closeCursor();
    echo empty($output) ?
      "{\"affectedRows\":$affectedRows,\"insertId\":$insertId,\"message\":\"$errorInfo\"}" :
      json_encode($output);
}
catch (PDOException $exception) {
    trigger_error($exception->getMessage());
    trigger_error($input);
    echo '{"affectedRows":0,"insertId":0,"message":"'.$exception->getMessage().'"}';
}
?>
