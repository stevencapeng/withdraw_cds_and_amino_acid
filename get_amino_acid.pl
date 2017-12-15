($data)=@ARGV;
%amino_acid=('GCT'=>'A','GCC'=>'A','GCA'=>'A','GCG'=>'A',
             'CGT'=>'R','CGC'=>'R','CGA'=>'R','CGG'=>'R','AGA'=>'R','AGG'=>'R',
			 'AAT'=>'N','AAC'=>'N',
			 'GAT'=>'D','GAC'=>'D',
             'TGT'=>'C','TGC'=>'C',
			 'CAA'=>'Q','CAG'=>'Q',
			 'GAA'=>'E','GAG'=>'E',
			 'GGT'=>'G','GGC'=>'G','GGA'=>'G','GGG'=>'G',
			 'CAT'=>'H','CAC'=>'H',
			 'ATT'=>'I','ATC'=>'I','ATA'=>'I',
			 'TTA'=>'L','TTG'=>'L','CTT'=>'L','CTC'=>'L','CTA'=>'L','CTG'=>'L',
			 'AAA'=>'K','AAG'=>'K',
			 'ATG'=>'M',
			 'TTT'=>'F','TTC'=>'F',
             'CCT'=>'P','CCC'=>'P','CCA'=>'P','CCG'=>'P',
			 'TCT'=>'S','TCC'=>'S','TCA'=>'S','TCG'=>'S','AGT'=>'S','AGC'=>'S',
			 'ACT'=>'T','ACC'=>'T','ACA'=>'T','ACG'=>'T',
			 'TGG'=>'W',
			 'TAT'=>'Y','TAC'=>'Y',
			 'GTT'=>'V','GTC'=>'V','GTA'=>'V','GTG'=>'V',
			 'TAG'=>'U','TGA'=>'U','TAA'=>'U');
open (IN,$data)||die "can not open";
while (<IN>) {
chomp;
 my $num=1;
 if ($_=~/^>/) {
 print "$_\n";
 }
 else {
  $_=~s/TAG$//;
  $_=~s/TGA$//;
  $_=~s/TAA$//;
  $csdnum=length($_);
  while ($_=~/(...)/g) {
    print "$amino_acid{$1}";
    if ($num%60==0) {
    print "\n";
    }
    $num+=1;
    }
  if ($num%60!=1) {print"\n";}
  }
 }