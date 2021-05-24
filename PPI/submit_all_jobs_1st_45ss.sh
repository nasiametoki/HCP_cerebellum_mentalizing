#!/bin/sh
jid=$(qsub submit_PPI_STEP1_runAROMA_1st_45ss.sh)
jid=$(qsub -W depend=afterok:${jid} submit_PPI_STEP2_runFilter_1st_45ss.sh)
jid=$(qsub -W depend=afterok:${jid} submit_PPI_STEP3_L1ppi_1st_45ss.sh)
jid=$(qsub -W depend=afterok:${jid} submit_PPI_STEP4_L2ppi_small_size_1st_45ss.sh)
jid=$(qsub -W depend=afterok:${jid} submit_PPI_STEP5_L1ppi_brain_1st_45ss.sh)
qsub -W depend=afterok:${jid} submit_PPI_STEP6_L2ppi_brain_small_size_1st_45ss.sh
