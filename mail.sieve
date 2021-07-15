
require ["copy", "fileinto", "imap4flags", "variables", "envelope", "fileinto", "subaddress", "mailbox"];

if header :contains ["From"] "finshots" {
  addflag "\\Seen";
}

if header :contains ["From"] "donotreply@gst.gov.in" {
  fileinto "GST";
} elsif header :contains ["From"] "notify@keybase.io" {
  fileinto "Updates/Keybase";
} elsif address :matches :user "To" "*" {
  set :lower :upperfirst "foldername" "${1}";
  fileinto :create "${foldername}";
}

redirect "virtualkannan007@gmail.com";
keep;