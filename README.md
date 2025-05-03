[##<ins> **Non-native-conformation-generation-by-threading**</ins>](https://github.com/ABLab2018/Fortran-codes/tree/main/non-native-conformation-generation)

Required parameter: Total number of proteins considered("n"), chain length of the target protein ("ntar") 

Required inputs: PDB IDs of the proteins considered for non-native conformation generation, C-alpha coordinates of proteins 

Compile the code with a fortran compiler: [f95 threading-conf-gen.f](https://github.com/ABLab2018/Fortran-codes/blob/main/non-native-conformation-generation/threading-conf-gen.f) 

execute the file (./a.out)\

[##<ins> **One-body-potential**</ins>](https://github.com/ABLab2018/Fortran-codes/tree/main/One-body-potential)
**Step 1:**

Required parameter: Total number of proteins considered("np"), Total number of nearest neighbors to be considered ("nf")\

Required inputs: PDB IDs of the proteins considered for potential generation, a file containing names of nearest neighbors (say for amino acid ALA,ALA-nn01....ALA-nn10), C-alpha coordinates of proteins\

Compile the code with a fortran compiler: [f95 cal-dist-between-aa-for-pot-gen.f]([url](https://github.com/ABLab2018/Fortran-codes/blob/main/One-body-potential/cal-dist-between-aa-for-pot-gen.f)) \

execute the file (./a.out)\

**Step 2**

Compile the code with a fortran compiler: [f95 cal-prob-based-on-bin-size.f]([url](https://github.com/ABLab2018/Fortran-codes/blob/main/One-body-potential/cal-prob-based-on-bin-size.f)) \
 
execute the file (./a.out)\

**Step 3**

Compile the code with a fortran compiler: [f95 cal-av-all-aa.f\]([url](https://github.com/ABLab2018/Fortran-codes/blob/main/One-body-potential/cal-av-all-aa.f))

execute the file (./a.out)\

**Step 4**

Compile the code with a fortran compiler: [f95 pot-generation.f](https://github.com/ABLab2018/Fortran-codes/blob/main/One-body-potential/pot-generation.f) \

execute the file (./a.out)\

[##<ins> **Two-body-potential**</ins>]([url](https://github.com/ABLab2018/Fortran-codes/tree/main/Two-body-potential))

**Step 1:**

Required parameter: Total number of proteins considered("m"), Total amino acid pairs ("n"), User defined distance cutoff ("rcut")\

Required inputs: PDB IDs of the proteins considered for potential generation, a file containing names of amino acid pairs, C-alpha coordinates of proteins\

Compile the code with a fortran compiler: [f95 all-contact-and-actual-contact.f]([url](https://github.com/ABLab2018/Fortran-codes/blob/main/Two-body-potential/all-contact-and-actual-contact.f))\

execute the file (./a.out)\

**Step 2**

Compile the code with a fortran compiler: [f95 actual-pair-prob.f]([url](https://github.com/ABLab2018/Fortran-codes/blob/main/Two-body-potential/actual-pair-prob.f))\

execute the file (./a.out)\

**Step 3**

Compile the code with a fortran compiler: [f95 individual-probability-all-aminoacids.f]([url](https://github.com/ABLab2018/Fortran-codes/blob/main/Two-body-potential/individual-probability-all-aminoacids.f))\

execute the file (./a.out)\

**Step 4**

Compile the code with a fortran compiler: [f95 multi-individual-prob.f]([url](https://github.com/ABLab2018/Fortran-codes/blob/main/Two-body-potential/multi-individual-prob.f))\

execute the file (./a.out)\

**Step 5**

Compile the code with a fortran compiler: f95 [multi-indi-prob-and-actual-pair-prob.f]([url](https://github.com/ABLab2018/Fortran-codes/blob/main/Two-body-potential/multi-indi-prob-and-actual-pair-prob.f))\

execute the file (./a.out)\

**Step 6**

Compile the code with a fortran compiler: [f95 two-body-potential-modified.f]([url](https://github.com/ABLab2018/Fortran-codes/blob/main/Two-body-potential/two-body-potential-modified.f))\

execute the file (./a.out)\

[##<ins> **Protein-sequence-design-by-MC**</ins>]([url](https://github.com/ABLab2018/Fortran-codes/tree/main/Protein-sequence-design))

**Step 1** 

Required parameter: Total number of conformations considered (non-native+target)("np, say for 6FM8"), chain length of the target protein ("n")\

Required inputs: C-alpha coordinates of all the conformations\

Compile the code with a fortran compiler: [f95 Contact-profile.f]([url](https://github.com/ABLab2018/Fortran-codes/blob/main/Protein-sequence-design/Contact-profile.f))\

execute the file (./a.out)\

**Step 2**

Required inputs: One body potential file, two body potential files, contact profiles, bin indexes for all C-alpha distances for all nearest neighbours\

Compile the code with a fortran compiler: [f95 mc-seq-design-delta.f]([url](https://github.com/ABLab2018/Fortran-codes/blob/main/Protein-sequence-design/mc-seq-design-delta.f))\

execute the file (./a.out)\
