# Workflow

Instructions for this assignment can be found [here](case04_hw02_instructions.pdf).

1. Run [BLAST](http://blast.ncbi.nlm.nih.gov/Blast.cgi)
    - Query: [`case04_hw02_query.fa`](case04_hw02_query.fa)
    - Results: [`case04_hw02_blast.fa`](case04_hw02_blast.fa)
1. Search [Genbank](http://www.ncbi.nlm.nih.gov/nuccore)
    - [Query](case04_hw02_genbank.md): 
      ```
      (("Zika virus"[Organism] OR Zika virus[All Fields]) AND envelope[All Fields]) AND "Zika virus"[porgn] AND ("1"[SLEN] : "1000"[SLEN])
      ```
    - Results: 107 sequences in [`case04_hw02_genbank.fa`](case04_hw02_genbank.fa)
1. Multiple sequence alignment with [MUSCLE](http://www.ebi.ac.uk/Tools/msa/muscle/)
    - Query: [`case04_hw02_genbank.fa`](case04_hw02_genbank.fa)
    - Results: [`case04_hw02_muscle.fa`](case04_hw02_muscle.fa)
1. Build a phylogenetic tree using [Simple Phylogeny](https://www.ebi.ac.uk/Tools/phylogeny/simple_phylogeny/)
    - Query: [`case04_hw02_muscle.fa`](case04_hw02_muscle.fa)
    - Results: [`case04_hw02_tree.nwk`](case04_hw02_tree.nwk)
1. Visualize the Newick tree using [FigTree](https://github.com/rambaut/figtree)
<!-- - Results: 
![](path/to/image)
-->
