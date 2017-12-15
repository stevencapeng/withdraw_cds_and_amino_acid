($data,$data2)=@ARGV;#genome.fa  genome.gff
my $row=0;
$col2=0;
open(IN,$data)||die"can not open";
while (<IN>) {
 chomp;
 @str[$row]=$_;
 $row=$row+1;
 }
open(IN,$data2)||die"can not open";
while (<IN>) {
 chomp;
 @arr=split(/\t/,$_);
  if ($arr[2]=~/CDS/) {
   $arr[8]=~/Parent=(.*);/;
   $x=$1;
   $sequence=substr($str[1],$arr[3]-1,$arr[4]-$arr[3]+1);
   if (exists($seq{$x})) {
   $seq{$x}=$seq{$x}.$sequence;
   }
   else {
   $gender{$x}=$sequence;
   $seq{$x}=$sequence;
   $parent{$col2}=$x;
   $col2+=1;
   }
   }
  }
for ($col1=0;$col1<=$col2-1;$col1+=1) {
  if ($gender{$parent{$col1}=~/^-$/}) {
     $sequence=reverse($sequence);
     $sequence=~s/A/X/g;
     $sequence=~s/G/Y/g;
     $sequence=~s/T/A/g;
     $sequence=~s/C/G/g;
     $sequence=~s/X/T/g;
     $sequence=~s/Y/C/g;
   }
 print">$parent{$col1}\n$seq{$parent{$col1}}\n";
 }

   
      