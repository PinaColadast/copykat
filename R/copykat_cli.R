# copykat CLI ...test 

library(argparser)
library(copykat)

parser <- arg_parser(description='CopyKat function parser')

parser$add_argument('--rawmat', type='character', default='rawdata', help='Raw count matrix, txt file, gene as row, 
cell as column, tab delimited')
parser$add_argument('--id_type', type='character', default='S', help='ID type')
parser$add_argument('--cell_line', type='character', default='no', help='Cell line')
parser$add_argument('--ngene_chr', type='integer', default=5, help='Number of genes per chromosome')
parser$add_argument('--LOW_DR', type='double', default=0.05, help='Lower bound of DR')
parser$add_argument('--UP_DR', type='double', default=0.1, help='Upper bound of DR')
parser$add_argument('--win_size', type='integer', default=25, help='Window size')
parser$add_argument('--norm_cell_names', type='character', default='', help='a txt file refers to normal cell IDs otherwise default nothing')
parser$add_argument('--KS_cut', type='double', default=0.1, help='KS cut')
parser$add_argument('--sam_name', type='character', default='', help='Sample name')
parser$add_argument('--distance', type='character', default='euclidean', help='Distance')
parser$add_argument('--output_seg', type='logical', default='FALSE', help='Output segment')
parser$add_argument('--plot_genes', type='logical', default='TRUE', help='Plot genes')
parser$add_argument('--genome', type='character', default='hg20', help='Genome')
parser$add_argument('--n_cores', type='integer', default=1, help='Number of cores')

args <- parse_args(parser)

rawmat <- as.matrix(read.table(args$rawmat, header = TRUE, sep = "\t",
row.names = 0))

# check norm_cell_names

if(args$norm_cell_names != ""){
    norm_cell_names <- read.table(args$norm_cell_names, header=False, sep = "\t", row.names=NULL,
)[, 1]

}else{
    norm_cell_names <- args$norm_cell_names
}


result <- copykat(
  rawmat = rawmat,
  id.type = args$id_type,
  cell.line = args$cell_line,
  ngene.chr = args$ngene_chr,
  LOW.DR = args$LOW_DR,
  UP.DR = args$UP_DR,
  win.size = args$win_size,
  norm.cell.names = norma_cell_names,
  KS.cut = args$KS_cut,
  sam.name = args$sam_name,
  distance = args$distance,
  output.seg = args$output_seg,
  plot.genes = args$plot_genes,
  genome = args$genome,
  n.cores = args$n_cores
)


