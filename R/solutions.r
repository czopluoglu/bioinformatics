
require(here)

################################################################################

# Counting DNA nucleotides

dna <- read.table(here('data','rosalind_dna.txt'))

str(dna)

table(strsplit(dna[1,1],split='')[[1]])

################################################################################

# Transcribing DNA into RNA

dna <- read.table(here('data','rosalind_rna.txt'))[1,1]

dna_ <- strsplit(dna,split='')[[1]]
dna_[which(dna_=='T')]='U'

rna <- paste0(dna_,collapse='')
rna

################################################################################

# Complementing a Strand of DNA

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















