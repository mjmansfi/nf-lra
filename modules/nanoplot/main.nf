#!/usr/bin/env nextflow

// Specify DSL2
nextflow.preview.dsl = 2

// Trimming reusable component
process nanoplot {
  publishDir "${params.outdir}/nanoplot",
    mode: "copy", overwrite: true

  container "mjmansfi/nf-modules-nanoplot:0.1"

  input:
    tuple val(sample_id), path(reads)
  output:
    tuple val(sample_id), path("*{pdf,html,log}"), emit: nanoplotOutputs
    path "*.html", emit: report

  script:

  // Check main args string exists and strip whitespace
  args = ""
  if(params.nanoplot_args && params.nanoplot_args != "") {
    ext_args = params.nanoplot_args
    args += " " + ext_args.trim()
  }

  // Construct command line
  nanoplot_command = "NanoPlot ${args} -t ${task.cpus} --N50 -f pdf --fastq $reads -p ${sample_id}."

  // Logging
  if (params.verbose){
    println ("[MODULE] nanoplot command: " + nanoplot_command)
  }

  // SHELL
  """
  ${nanoplot_command}
  """

}
