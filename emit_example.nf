// Example on how to use emit: correctly with dsl2
// Note: as of now, the "file" channel specification does not work with emit. 
// Use path instead.

/ enable dsl2:
nextflow.enable.dsl=2

// Either of these processes work:

process do_foo {
    output:
    path "output.txt", emit: foo_item
    script:
    """
    touch output.txt
    """
}

process do_foo2 {
    output:
    path("output.txt", emit: foo_item2)
    script:
    """
    touch output.txt
    """
}

process some_downstream_program {
  input:
  path textfile
  
  output:
  file("*")
  
  script:
  """
  cat $textfile
  """
}

// By using either of the processes above, the workflow may correctly access the data you want to use by specifying with process.out.emit_name
workflow {
    do_foo()
    some_downstream_program(doo_foo.out.foo_item)
}
