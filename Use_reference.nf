// Problem description
// In this case, we have a database directory. We want to search this database
// directory with several different read sets.
// In order to get the database directory in, we need to send it in as a 
// value channel, otherwise it will be consumed. 
// We then input it as a path in the process. This ensures that it is being
// softlinked into the working directory. 



amr_db = '/cluster/projects/nn9305k/db_flatfiles/specific_genes_bifrost/amr/card_db'
reads = '../testreads/*R{1,2}.fastq.gz'

amr_val_ch = Channel.value(amr_db)
.view()
reads_ch = Channel.fromFilePairs(reads)
.view()

process test {

```
input:
path amr_db_dir from amr_val_ch
tuple val(sample_id), file(reads) from reads_ch

"""
echo testcommd ${amr_db_dir} ${reads}
"""

```

}
