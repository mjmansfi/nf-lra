#!/usr/bin/env nextflow

// Specify DSL2
nextflow.preview.dsl = 2

// Process definition
process flye {
    publishDir "${params.outdir}/flye",
        mode: "copy", overwrite: true

    container 'mjmansfi/nf-modules-flye'

    input:
        tuple val(sample_id), val(genome_size), path(reads)

    output:
        tuple val(sample_id), path("_assembly"), emit: flyeAssembly

    script:

    // Check main args string exists and strip whitespace
    args = ""
    if(params.flye_args && params.flye_args != "") {
        ext_args = params.flye_args
        args += " " + ext_args.trim()
    }

    flye_command = "flye --genome-size ${genome_size} --threads ${task.cpus} --out-dir ${sample_id} --nano-raw $reads"

    // Log
    if (params.verbose){
        println ("[MODULE] flye command: " + flye_command)
    }

    """
    ${flye_command}
    """
}
