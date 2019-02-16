<?php // -*-mode: PHP; coding:utf-8;-*-
namespace MRBS;

/**************************************************************************
 *   MRBS Configuration File
 *   Configure this file for your site.
 *   You shouldn't have to modify anything outside this file.
 *
 *   This file has already been populated with the minimum set of configuration
 *   variables that you will need to change to get your system up and running.
 *   If you want to change any of the other settings in systemdefaults.inc.php
 *   or areadefaults.inc.php, then copy the relevant lines into this file
 *   and edit them here.   This file will override the default settings and
 *   when you upgrade to a new version of MRBS the config file is preserved.
 **************************************************************************/

/**********
 * Timezone
 **********/
 
$timezone = "Asia/Taipei";


/*******************
 * Database settings
 ******************/
// Which database system: "pgsql"=PostgreSQL, "mysql"=MySQL
$dbsys = "mysql";
// Hostname of database server. For pgsql, can use "" instead of localhost
// to use Unix Domain Sockets instead of TCP/IP. For mysql "localhost"
// tells the system to use Unix Domain Sockets, and $db_port will be ignored;
// if you want to force TCP connection you can use "127.0.0.1".
$db_host = "booking.ncu.edu.tw";
// If you need to use a non standard port for the database connection you
// can uncomment the following line and specify the port number
$db_port = 3307;
// Database name:
$db_database = "mrbs";
// Schema name.  This only applies to PostgreSQL and is only necessary if you have more
// than one schema in your database and also you are using the same MRBS table names in
// multiple schemas.
//$db_schema = "public";
// Database login user name:
$db_login = "mrbs";
// Database login password:
$db_password = '!Ggininder';
// Prefix for table names.  This will allow multiple installations where only
// one database is available
$db_tbl_prefix = "mrbs_";

$db_persist = FALSE;

/* Add lines from systemdefaults.inc.php and areadefaults.inc.php below here
   to change the default configuration. Do _NOT_ modify systemdefaults.inc.php
   or areadefaults.inc.php.  */

/**********
 * Language
 **********/

$disable_automatic_language_changing = 1;
$default_language_tokens = "zh-tw";
$override_locale = "";
$faqfilelang = "_tw"; 



/*********************************
 * Site identification information
 *********************************/
$mrbs_admin = "akikolin";

$mrbs_admin_email = "akikolin@cc.ncu.edu.tw";

$mrbs_company = "中央大學-課務組";   // This line must always be uncommented ($mrbs_company is used in various places)

$mrbs_company_logo = "images/logo.gif";    // name of your logo file.   This example assumes it is in the MRBS directory

$mrbs_company_url = "http://pdc.adm.ncu.edu.tw/course_index.asp?roadno=107";

$url_base = "";



/**********************************************
 * Email settings
 **********************************************/

// BASIC SETTINGS
// --------------

// Set the email address of the From field. Default is 'admin_email@your.org'
$mail_settings['from'] = 'no-reply@mail.ncuisq.tk';

$mail_settings['organizer'] = 'admin@mail.ncuisq.tk';

$mail_settings['recipients'] = 'mansion.lai.411@gmail.com,spyro12393@g.ncu.edu.tw';

$mail_settings['cc'] = '';

$mail_settings['treat_cc_as_to'] = false;


// WHO TO EMAIL
// ------------
$mail_settings['admin_on_bookings']      = true;  // the addresses defined by $mail_settings['recipients'] below
$mail_settings['area_admin_on_bookings'] = true;  // the area administrator
$mail_settings['room_admin_on_bookings'] = true;  // the room administrator
$mail_settings['booker']                 = true;  // the person making the booking
$mail_settings['book_admin_on_approval'] = false;  // the booking administrator when booking approval is enabled
                                                   // (which is the MRBS admin, but this setting allows MRBS
                                                   // to be extended to have separate booking approvers)     

// WHEN TO EMAIL
// -------------
$mail_settings['on_new']    = true;   // when an entry is created
$mail_settings['on_change'] = true;  // when an entry is changed
$mail_settings['on_delete'] = true;  // when an entry is deleted

$mail_settings['allow_no_mail']        = false;
$mail_settings['allow_admins_no_mail'] = true;  // Ignored if 'allow_no_mail' is true
$mail_settings['no_mail_default'] = false; // Default value for the 'no mail' checkbox.  
                                           // true for checked (ie don't send mail),
                                           // false for unchecked (ie do send mail)


// WHAT TO EMAIL
// -------------
$mail_settings['details']   = true; // Set to true if you want full booking details;
                                     // otherwise you just get a link to the entry
$mail_settings['html']      = true; // Set to true if you want HTML mail
$mail_settings['icalendar'] = false; // Set to true to include iCalendar details
                                     // which can be imported into a calendar.  (Note:
                                     // iCalendar details will not be sent for areas
                                     // that use periods as there isn't a mapping between
                                     // periods and time of day, so the calendar would not
                                     // be able to import the booking)


// HOW TO EMAIL - ADDRESSES
// ------------------------
$mail_settings['domain'] = '@cc.ncu.edu.tw';

$mail_settings['username_suffix'] = '';

// HOW TO EMAIL - BACKEND
// ----------------------
$mail_settings['admin_backend'] = 'smtp';

/*******************
 * SMTP settings
 */

// These settings are only used with the "smtp" backend
$smtp_settings['host'] = 'mail.ncuisq.tk';  // SMTP server
$smtp_settings['port'] = 465;           // SMTP port number
$smtp_settings['auth'] = true;        // Whether to use SMTP authentication
$smtp_settings['secure'] = 'ssl';         // Encryption method: '', 'tls' or 'ssl' - note that 'tls' means TLS is used even if the SMTP
                                       // server doesn't advertise it. Conversely if you specify '' and the server advertises TLS, TLS
                                       // will be used, unless the 'disable_opportunistic_tls' configuration parameter shown below is
                                       // set to true.
$smtp_settings['username'] = 'no-reply';       // Username (if using authentication)
$smtp_settings['password'] = 'ncu@ggininder';       // Password (if using authentication)
$smtp_settings['disable_opportunistic_tls'] = false; // Set this to true to disable
                                                     // opportunistic TLS
                                                     // https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting#opportunistic-tls
// If you're having problems with sending email to a TLS-enabled SMTP server *which you trust* you can change the following
// settings, which reduce TLS security.
// See https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting#php-56-certificate-verification-failure
$smtp_settings['ssl_verify_peer'] = false;
$smtp_settings['ssl_verify_peer_name'] = false;
$smtp_settings['ssl_allow_self_signed'] = false;

// EMAIL - MISCELLANEOUS
// ---------------------
$mail_settings['ics_filename'] = "booking";

$mail_settings['debug'] = false;
// Where to send the debug output.  Can be 'browser' or 'log' (for the error_log)
$mail_settings['debug_output'] = 'log';

$mail_settings['disabled'] = false;
 
$auth["type"]="db";
$auth["session"]="php";
$auth['only_admin_can_see_other_users'] = true;
$auth['show_bulk_delete'] = true;

/******************
 * Display settings
 ******************/
$area_list_format = "select";

$monthly_view_entries_details = "both";

$view_week_number = TRUE;

$default_view = "week";


/*******************
 * for web--Jason. 1115 modified by JJ
 */
$web_host = "https://booking.ncu.edu.tw";

/*******************
 * Booking types configuration. Use for tags. (modified by JJ)
 */
$booking_types[] = "B";
$vocab_override["zh-tw"]["type.B"] = "未選擇種類";
$vocab_override["en"]["type.B"] = "Unknown Type";
//$booking_types[] = "E";
$vocab_override["zh-tw"]["type.E"] = "一般課程";
$vocab_override["en"]["type.E"] = "Regular Class";
//$booking_types[] = "I";
$vocab_override["zh-tw"]["type.I"] = "社團活動";
$vocab_override["en"]["type.I"] = "Club Activity";
$booking_types[] = "A";
$vocab_override["zh-tw"]["type.A"] = "臨時課程";
$vocab_override["en"]["type.A"] = "Temporary Class";
