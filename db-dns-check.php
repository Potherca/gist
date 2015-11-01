<?php

if (isset($_GET['info'])) {
    phpinfo();
} elseif (isset($_GET['dns'])) {
    $url = parse_url(getenv('CLEARDB_DATABASE_URL'));
    $host = $url['host'];

    echo gethostbyname($host);
    var_export(dns_get_record($host));
} else {
    $url = parse_url(getenv('CLEARDB_DATABASE_URL'));

    $host = $url['host'];
    $username = $url['user'];
    $password = $url['pass'];
    $database = substr($url['path'], 1);

    $dsn = sprintf(
        'mysql:dbname=%s;host=%s',
        $database, $host
    );

    try {
        $pdo = new PDO($dsn, $username, $password);
        $statement = $pdo->query('SHOW VARIABLES;');
        $statement->execute();

        $results = $statement->fetchAll();
        foreach ($results as $result) {
            printf('<li>%s: %s</li>', $result['Variable_name'], $result['Value']);
        }
    } catch (PDOException $result) {
        echo 'Connection failed';
        var_dump($result);
    }
}

/*EOF*/
