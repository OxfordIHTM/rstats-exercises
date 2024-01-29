ba = read.table("https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/ba.dat",header=TRUE)

BandA =function(W,M){
  meanD=mean(abs(W-M))
  SDD=sd(abs(W-M))
  L=meanD-1.96*SDD
  U=meanD+1.96*SDD
  
  return (list(meanD,L,U))
   
}

H = BandA(ba$Wright,ba$Mini)

