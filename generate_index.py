
"""
This script crawls through subdirectories of applications/, tools/, libraries/,
and compilers/ and generates Sphinx include files for navigation
and overview tables.
"""

#-------------------------------------------------------------------------------

def repeat_char(char, length):
    """
    Repeats character length times.
    """
    return char*length

def test_repeat_char():
    """
    Tests test_repeat_char.
    """
    assert repeat_char('r', 5) == 'rrrrr'

#-------------------------------------------------------------------------------

def underline_text(text, char):
    """
    Underline text with char.
    """
    underlined = []
    underlined.append(text)
    underlined.append(repeat_char(char, len(text)))
    return '\n'.join(underlined)

def test_underline_text():
    """
    Tests test_underline_text.
    """
    assert underline_text('Raboof!', '=') == 'Raboof!\n======='

#-------------------------------------------------------------------------------

def get_divider_line(max_column_width, char, skip_first=False):
    """
    Constructs divider line for a Sphinx table.
    """
    if skip_first:
        text = ['|']
    else:
        text = ['+']
    for i, width in enumerate(max_column_width):
        if i == 0 and skip_first:
            text.append(repeat_char(' ', width + 2))
        else:
            text.append(repeat_char(char, width + 2))
        text.append('+')
    return ''.join(text)

def test_get_divider_line():
    """
    Tests get_divider_line.
    """
    divider = get_divider_line([3, 4, 5], '=')
    assert divider == '+=====+======+=======+'

    divider = get_divider_line([3, 4, 5], '-', skip_first=True)
    assert divider == '|     +------+-------+'

#-------------------------------------------------------------------------------

def get_sphinx_table(table):
    """
    Constructs Sphinx table from a two-dimensional list.
    """
    num_columns = len(table[0])

    max_column_width = []
    for i in range(num_columns):
        max_column_width.append(0)

    for line in table:
        assert len(line) == num_columns
        for i in range(num_columns):
            width = len(line[i])
            if width > max_column_width[i]:
                max_column_width[i] = width

    text = []
    for i, line in enumerate(table):
        skip_first = False
        if i == 0:
            text.append(get_divider_line(max_column_width, '-'))
        elif i == 1:
            text.append(get_divider_line(max_column_width, '='))
        else:
            # do not repeat program name if it is in the line above
            skip_first = (table[i][0] == table[i-1][0])
            text.append(get_divider_line(max_column_width, '-', skip_first))
        text2 = ['|']
        for j, word in enumerate(line):
            if j == 0 and skip_first:
                word2 = ' '
            else:
                word2 = word
            text2.append(' %s%s ' % (word2, repeat_char(' ', max_column_width[j] - len(word2))))
            text2.append('|')
        text.append(''.join(text2))
    text.append(get_divider_line(max_column_width, '-'))

    return '\n'.join(text)

def test_get_sphinx_table():
    """
    Tests get_sphinx_table.
    """
    table = get_sphinx_table([['foo', 'bar'], ['1', '2'], ['hey', 'ho']])

    reference = []
    reference.append('+-----+-----+')
    reference.append('| foo | bar |')
    reference.append('+=====+=====+')
    reference.append('| 1   | 2   |')
    reference.append('+-----+-----+')
    reference.append('| hey | ho  |')
    reference.append('+-----+-----+')

    assert table == '\n'.join(reference)

#-------------------------------------------------------------------------------

def generate_table(title_line, programs, version_d, systems, systems_dict, section, single_program=False, single_system=False):
    """
    Build table with hyperlinks.
    Function checks whether corresponding files exist and only
    includes the version where documentation is present.

    single_program=True generates overview table for a single code overview.
    single_system=True generates overview table for a single system.
    """
    import os

    table_body = []
    for program in programs:
        for system in systems:
            line = []
            for version in version_d[program]:
                if os.path.isfile(os.path.join(section, program, system, version, 'index.rst')):
                    if single_program:
                        line.append(":doc:`%s <%s/%s/index>`" % (version, system, version))
                    else:
                        line.append(":doc:`%s <%s/%s/%s/%s/index>`" % (version, section, program, system, version))
            if len(line) > 0:
                if single_program:
                    table_body.append([systems_dict[system], ', '.join(line)])
                else:
                    if single_system:
                        table_body.append([':doc:`%s <%s/%s/index>`' % (program, section, program), ', '.join(line)])
                    else:
                        table_body.append([':doc:`%s <%s/%s/index>`' % (program, section, program), systems_dict[system], ', '.join(line)])

    if table_body:
        table = []
        table.append(title_line)
        for line in table_body:
            table.append(line)
        return table

    return []

#-------------------------------------------------------------------------------

def get_list_of_programs(section):
    """
    This routine goes through the subdirectories under section/
    and gathers and returns all programs and versions
    under section/.
    """
    import os

    # sorting of version numbers
    from distutils.version import LooseVersion

    path_to_search = os.path.join(os.getcwd(), section)

    # get list of all installed programs
    programs = []
    version_d = {}
    for root, _, filenames in os.walk(path_to_search):
        for name in filenames:
            if name == 'general.rst':
                program = root.split('/')[-1]
                programs.append(program)
                version_d[program] = []

    # get list of all installed versions
    for root, _, filenames in os.walk(path_to_search):
        for name in filenames:
            if name == 'using.rst' or name == 'building.rst':
                version = root.split('/')[-1]
                program = root.split('/')[-3]
                if version not in version_d[program]:
                    version_d[program].append(version)

    # sort programs
    programs = sorted(programs, key=lambda s: s.lower())

    # sort versions
    for program in programs:
        version_d[program].sort(reverse=True, key=LooseVersion)

    return programs, version_d

#-------------------------------------------------------------------------------

def generate_version_index(systems, systems_dict, section, programs, version_d):
    """
    For each documented program/version
    generate combined index.rst from using.rst and building.rst
    basically doing a "cat using.rst building.rst > index.rst" with some annotations
    and navigation elements.
    """
    import os

    for program in programs:
        for version in version_d[program]:
            for system in systems:
                if os.path.exists(os.path.join(section, program, system, version)):
                    with open(os.path.join(section, program, system, version, 'index.rst'), 'w') as f_combined:

                        # this is because the generated page is not included in any toctree
                        f_combined.write(":orphan:\n\n")

                        # add navigation
                        f_combined.write(":doc:`../../../../index` - :doc:`../../index` - :doc:`index`\n\n")

                        for subsection in ['using', 'building']:
                            file_name = os.path.join(section, program, system, version, '%s.rst' % subsection)
                            if os.path.isfile(file_name):

                                # generate subtitle
                                text = '%s %s %s on %s' % (subsection.title(), program, version, systems_dict[system])
                                f_combined.write('\n%s\n\n' % underline_text(text, '='))

                                with open(file_name, 'r') as f:
                                     f_combined.write(f.read())

#-------------------------------------------------------------------------------

def generate_one_program_overview(systems, systems_dict, section, programs, version_d):
    """
    Build index.rst from general.rst and augment it with navigation.
    """
    import os

    # this generates a version overview for each program separately
    for program in programs:
        with open(os.path.join(section, program, 'index.rst'), 'w') as f_generated:

            # this is because the generated page is not included in any toctree
            f_generated.write(":orphan:\n\n")

            # add navigation
            f_generated.write(":doc:`../../index` - :doc:`index`\n\n")

            f_generated.write("%s\n\n" % underline_text("General information about %s" % program, '='))

            title_line = ['System', 'Available versions']
            table = generate_table(title_line, [program], version_d, systems, systems_dict, section, single_program=True)
            if table:
                f_generated.write('\n\n')
                f_generated.write(get_sphinx_table(table))
                f_generated.write('\n')

            with open(os.path.join(section, program, 'general.rst'), 'r') as f:
                f_generated.write('\n')
                f_generated.write(f.read())
                f_generated.write('\n')

            f_generated.write(".. include:: ../../disclaimer.inc\n")

#-------------------------------------------------------------------------------

def main():
    """
    Main function.
    """
    # list of systems/OS, if you remove OS, also ignore them
    # in conf.py (search there for "lindgren")
    # we should use ordereddict here but web server has too old python for that
    systems = ['beskow', 'centos7', 'milner']
    systems_dict = {}
    systems_dict['beskow'] = 'Beskow'
    systems_dict['centos7'] = 'Tegner'
    systems_dict['milner'] = 'Milner'

    # dictionary of sections mapping directory -> name on the screen
    # we should use ordereddict here but web server has too old python for that
    sections = ['applications','bioinformatic','chemistry','fluid_dynamics','molecular_dynamics',
      'other_applications','tools', 'visualization','mathematic','other_tools','compilers', 'libraries']
      
    section_underline = {}
    section_underline['applications'] = '-'
    section_underline['bioinformatic'] = '^'
    section_underline['chemistry'] = '^'
    section_underline['fluid_dynamics'] = '^'
    section_underline['molecular_dynamics'] = '^'
    section_underline['other_applications'] = '^'    
    section_underline['tools'] = '-'
    section_underline['visualization'] = '^'
    section_underline['mathematic'] = '^'
    section_underline['other_tools'] = '^'
    section_underline['compilers'] = '-'
    section_underline['libraries'] = '-'

    section_folder = {}
    section_folder['applications'] = False
    section_folder['bioinformatic'] = True
    section_folder['chemistry'] = True
    section_folder['fluid_dynamics'] = True
    section_folder['molecular_dynamics'] = True
    section_folder['other_applications'] = True   
    section_folder['tools'] = False
    section_folder['visualization'] = True
    section_folder['mathematic'] = True
    section_folder['other_tools'] = True
    section_folder['compilers'] = True
    section_folder['libraries'] = True
    
    sections_dict = {}
    sections_dict['applications'] = 'Applications'
    sections_dict['bioinformatic'] = 'Bioinformatics'
    sections_dict['chemistry'] = 'Computational chemistry'
    sections_dict['fluid_dynamics'] = 'Fluid dynamics'
    sections_dict['molecular_dynamics'] = 'Molecular dynamics'
    sections_dict['other_applications'] = 'Other applications'
    sections_dict['tools'] = 'Tools'
    sections_dict['visualization'] = 'Visualization'
    sections_dict['mathematic'] = 'Mathematic'
    sections_dict['other_tools'] = 'Other tools'
    sections_dict['compilers'] = 'Compilers and Languages'
    sections_dict['libraries'] = 'Libraries'

    # write machine-specific navigation
    line = []
    line.append(':doc:`All <index>`')
    for system in systems:
        line.append(':doc:`%s <index_%s>`' % (systems_dict[system], system))

    list_of_files = []
    list_of_files.append('overview_all.inc')
    for system in systems:
        list_of_files.append('overview_%s.inc' % system)
    for f in list_of_files:
        with open('%s' % f, 'w') as include_file:
            include_file.write('\nSystems: ' + ', '.join(line))

    # copy index.rst to machine specific index files
    with open('index.rst', 'r') as f:
        s = f.read()
    for system in systems:
        with open('index_%s.rst' % system, 'w') as f:
            f.write(':orphan:\n\n')
            f.write(s.replace('overview_all.inc', 'overview_%s.inc' % system))

    for section in sections:
        programs, version_d = get_list_of_programs(section)
        generate_version_index(systems, systems_dict, section, programs, version_d)
        generate_one_program_overview(systems, systems_dict, section, programs, version_d)

        if section_folder[section] and len(programs)==0:
          continue
        # here we build the big overview table for all systems
        with open('overview_all.inc', 'a') as include_file:
            include_file.write('\n\n%s\n' % underline_text(sections_dict[section], section_underline[section]))
            if len(programs) > 0:
              include_file.write('.. include:: overview_all_%s.inc\n' % section)
              title_line = ['Program', 'System', 'Available versions']
              with open('overview_all_%s.inc' % section, 'w') as include_file:
                  table = generate_table(title_line, programs, version_d, systems, systems_dict, section)
                  if len(table) > 0:
                      include_file.write(get_sphinx_table(table))

        # and here for each system separately
        for system in systems:
            with open('overview_%s.inc' % system, 'a') as include_file:
                include_file.write('\n\n%s\n' % underline_text(sections_dict[section], section_underline[section]))
                if len(programs) > 0:
                  include_file.write('.. include:: overview_%s_%s.inc\n' % (system, section))
                  title_line = ['Program', 'Available versions']
                  with open('overview_%s_%s.inc' % (system, section), 'w') as include_file:
                      table = generate_table(title_line, programs, version_d, [system], systems_dict, section, single_system=True)
                      if len(table) > 0:
                          include_file.write(get_sphinx_table(table))

#-------------------------------------------------------------------------------

if __name__ == '__main__':
    main()
