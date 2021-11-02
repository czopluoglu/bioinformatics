
require(here)

################################################################################

# 1 - Counting DNA nucleotides
# http://rosalind.info/problems/dna/

dna <- read.table(here('data','rosalind_dna.txt'))

str(dna)

table(strsplit(dna[1,1],split='')[[1]])

################################################################################

# 2 - Transcribing DNA into RNA
# http://rosalind.info/problems/rna/

dna <- read.table(here('data','rosalind_rna.txt'))[1,1]

dna_ <- strsplit(dna,split='')[[1]]
dna_[which(dna_=='T')]='U'

rna <- paste0(dna_,collapse='')
rna

################################################################################

# 3 - Complementing a Strand of DNA
# http://rosalind.info/problems/revc/

s <- read.table(here('data','rosalind_revc.txt'))[1,1]

s_ <- strsplit(s,split='')[[1]]

r <- s_[length(s_):1]

r_c <- r

tmp_a <- which(r_c=='A')
tmp_t <- which(r_c=='T')
tmp_c <- which(r_c=='C')
tmp_g <- which(r_c=='G')

r_c[tmp_a]='T'
r_c[tmp_t]='A'
r_c[tmp_c]='G'
r_c[tmp_g]='C'

rc <- paste0(r_c,collapse='')

rc

################################################################################

# 4 - Rabbits and Recurrence Relations
# http://rosalind.info/problems/fib/

s <- read.table(here('data','rosalind_fib.txt'))

n = as.numeric(s[1])
k = as.numeric(s[2])

f   <- c()
f[1] <- 1
f[2] <- 1

for(i in 3:n){
  
  f[i] = f[i-1] + f[i-2]*k
  
}

f[n]

################################################################################

# 5 - Computing GC Content
# http://rosalind.info/problems/gc/


s <- scan(here('data','rosalind_gc.txt'),
          what = 'character')


loc <- grep('>Rosalind_',s)
gc  <- c()

for(i in 1:length(loc)){

  if(i < length(loc)){
    temp  <- paste0(s[(loc[i]+1):(loc[i+1]-1)],collapse ='')
    temp2 <- strsplit(temp,split = '')[[1]]
    gc[i] <- length(which(temp2=='C' | temp2=='G'))/length(temp2)
  }
  
  if(i == length(loc)){
    temp  <- paste0(s[(loc[i]+1):length(s)],collapse ='')
    temp2 <- strsplit(temp,split = '')[[1]]
    gc[i] <- length(which(temp2=='C' | temp2=='G'))/length(temp2)
  }
}


s[loc][which.max(gc)]
round(gc[which.max(gc)]*100,5)

