<?php
/**
 * 1. .env Loader - Wajib ada agar variabel DB dan URL terbaca
 */
if (file_exists(__DIR__ . '/.env')) {
    $lines = file(__DIR__ . '/.env', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) continue;
        $parts = explode('=', $line, 2);
        if (count($parts) === 2) {
            $name = trim($parts[0]);
            $value = trim($parts[1]);
            // Masukkan ke semua global agar pasti terbaca
            putenv("$name=$value");
            $_ENV[$name] = $value;
            $_SERVER[$name] = $value;
        }
    }
}

define('ENVIRONMENT', isset($_SERVER['CI_ENV']) ? $_SERVER['CI_ENV'] : 'development');

/**
 * 2. ERROR REPORTING - Fix untuk PHP 8.4
 */
switch (ENVIRONMENT)
{
    case 'development':
        // Menggunakan bitmask 22527 untuk membungkam error Deprecated di PHP 8.4
        error_reporting(22527); 
        ini_set('display_errors', 1);
    break;
    case 'testing':
    case 'production':
        ini_set('display_errors', 0);
        error_reporting(0);
    break;
    default:
        header('HTTP/1.1 503 Service Unavailable.', TRUE, 503);
        echo 'The application environment is not set correctly.';
        exit(1); 
}

/* --- JANGAN UBAH KODE DI BAWAH INI (SISTEM CODEIGNITER) --- */
$system_path = 'system';
$application_folder = 'application';
$view_folder = '';
if (defined('STDIN')) { chdir(dirname(__FILE__)); }
if (($_temp = realpath($system_path)) !== FALSE) { $system_path = $_temp.DIRECTORY_SEPARATOR; }
else { $system_path = strtr(rtrim($system_path, '/\\'), '/\\', DIRECTORY_SEPARATOR.DIRECTORY_SEPARATOR).DIRECTORY_SEPARATOR; }
if ( ! is_dir($system_path)) { header('HTTP/1.1 503 Service Unavailable.', TRUE, 503); exit(3); }
define('SELF', pathinfo(__FILE__, PATHINFO_BASENAME));
define('BASEPATH', $system_path);
define('FCPATH', dirname(__FILE__).DIRECTORY_SEPARATOR);
define('SYSDIR', basename(BASEPATH));
if (is_dir($application_folder)) {
    if (($_temp = realpath($application_folder)) !== FALSE) { $application_folder = $_temp; }
    else { $application_folder = strtr(rtrim($application_folder, '/\\'), '/\\', DIRECTORY_SEPARATOR.DIRECTORY_SEPARATOR); }
} elseif (is_dir(BASEPATH.$application_folder.DIRECTORY_SEPARATOR)) {
    $application_folder = BASEPATH.strtr(trim($application_folder, '/\\'), '/\\', DIRECTORY_SEPARATOR.DIRECTORY_SEPARATOR);
} else { header('HTTP/1.1 503 Service Unavailable.', TRUE, 503); exit(3); }
define('APPPATH', $application_folder.DIRECTORY_SEPARATOR);
if ( ! isset($view_folder[0]) && is_dir(APPPATH.'views'.DIRECTORY_SEPARATOR)) { $view_folder = APPPATH.'views'; }
elseif (is_dir($view_folder)) {
    if (($_temp = realpath($view_folder)) !== FALSE) { $view_folder = $_temp; }
    else { $view_folder = strtr(rtrim($view_folder, '/\\'), '/\\', DIRECTORY_SEPARATOR.DIRECTORY_SEPARATOR); }
} elseif (is_dir(APPPATH.$view_folder.DIRECTORY_SEPARATOR)) {
    $view_folder = APPPATH.strtr(trim($view_folder, '/\\'), '/\\', DIRECTORY_SEPARATOR.DIRECTORY_SEPARATOR);
} else { header('HTTP/1.1 503 Service Unavailable.', TRUE, 503); exit(3); }
define('VIEWPATH', $view_folder.DIRECTORY_SEPARATOR);
require_once BASEPATH.'core/CodeIgniter.php';