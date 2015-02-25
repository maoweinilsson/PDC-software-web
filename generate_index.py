
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

def generate_table(title_line, programs, version_d, systems, section, subsection, single_program=False, single_system=False):
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
                if os.path.isfile(os.path.join(section, program, system, version, '%s.rst' % subsection)):
                    if single_program:
                        line.append(":doc:`%s <%s/%s/%s>`" % (version, system, version, subsection))
                    else:
                        line.append(":doc:`%s <%s/%s/%s/%s/%s>`" % (version, section, program, system, version, subsection))
            if len(line) > 0:
                if single_program:
                    table_body.append([system.title(), ', '.join(line)])
                else:
                    if single_system:
                        table_body.append([':doc:`%s <%s/%s/general>`' % (program, section, program), ', '.join(line)])
                    else:
                        table_body.append([':doc:`%s <%s/%s/general>`' % (program, section, program), system.title(), ', '.join(line)])

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

def generate_include_files(systems, section, programs, version_d):
    """
    Build include files which contain title and version.
    """
    import os

    for program in programs:
        for version in version_d[program]:
            for system in systems:
                for subsection in ['using', 'building']:
                    if os.path.isfile(os.path.join(section, program, system, version, '%s.rst' % subsection)):
                        with open(os.path.join(section, program, system, version, '%s.inc' % subsection), 'w') as f_include:

                            # add navigation
                            f_include.write(":doc:`../../../../index` - :doc:`../../general` - :doc:`%s`\n\n" % subsection)

                            text = '%s %s %s on %s' % (subsection.title(), program, version, system.title())
                            f_include.write('%s\n' % underline_text(text, '='))

#-------------------------------------------------------------------------------

def generate_one_program_overview(systems, section, programs, version_d):
    """
    Build include files which contain title and version.
    """
    import os

    # this generates a version overview for each program separately
    for program in programs:
        with open(os.path.join(section, program, 'include.inc'), 'w') as f_program:

            # add navigation
            f_program.write(":doc:`../../index` - :doc:`general`\n\n")

            f_program.write("%s\n\n" % underline_text("General information about %s" % program, '='))
            for subsection in ['using', 'building']:
                title_line = ['System', '%s instructions' % subsection.title()]
                table = generate_table(title_line, [program], version_d, systems, section, '%s' % subsection, single_program=True)
                if table:
                    f_program.write('\n\n')
                    f_program.write(get_sphinx_table(table))

#-------------------------------------------------------------------------------

def build_doc_section(systems, section, subsection, programs, version_d):

    title_line = ['Program', 'System', 'Available versions']
    with open('overview_%s_%s.inc' % (section, subsection), 'w') as include_file:
        table = generate_table(title_line, programs, version_d, systems, section, '%s' % subsection)
        if len(table) > 0:
            include_file.write(get_sphinx_table(table))

#-------------------------------------------------------------------------------

def build_doc_section_single_system(system, section, subsection, programs, version_d):

    title_line = ['Program', 'Available versions']
    with open('overview_%s_%s_%s.inc' % (section, subsection, system), 'w') as include_file:
        table = generate_table(title_line, programs, version_d, [system], section, '%s' % subsection, single_system=True)
        if len(table) > 0:
            include_file.write(get_sphinx_table(table))

#-------------------------------------------------------------------------------

def main():
    """
    Main function.
    """
    # list of systems, if you remove systems, also ignore them
    # in conf.py (search there for "lindgren")
    systems = ['beskow', 'ellen', 'povel', 'zorn']

    # dictionary of sections mapping directory -> name on the screen
    sections = {}
    sections['applications'] = 'Applications'
    sections['tools'] = 'Tools'
    sections['compilers'] = 'Compilers and Languages'
    sections['libraries'] = 'Libraries'

    list_of_files = []
    for subsection in ['using', 'building']:
        list_of_files.append('overview_%s.inc' % subsection)
        for system in systems:
            list_of_files.append('overview_%s_%s.inc' % (subsection, system))

    # write machine-specific navigation
    line = []
    line.append(':doc:`All <index>`')
    for system in systems:
        line.append(':doc:`%s <index_using_%s>`' % (system.title(), system))
    for f in list_of_files:
        with open('%s' % f, 'w') as include_file:
            if 'using' in f:
                include_file.write('\nSystems: ' + ', '.join(line))
            else:
                include_file.write('\n')

    # copy index.rst to machine specific index files
    with open('index.rst', 'r') as f:
        s = f.read()
    for system in systems:
        with open('index_using_%s.rst' % system, 'w') as f:
            f.write(s.replace('overview_using.inc', 'overview_using_%s.inc' % system))

    for section in sections:
        programs, version_d = get_list_of_programs(section)
        generate_include_files(systems, section, programs, version_d)
        generate_one_program_overview(systems, section, programs, version_d)
        if len(programs) > 0:
            for subsection in ['using', 'building']:
                with open('overview_%s.inc' % subsection, 'a') as include_file:
                    include_file.write('\n\n%s\n' % underline_text(sections[section], '-'))
                    include_file.write('.. include:: overview_%s_%s.inc\n' % (section, subsection))
                    build_doc_section(systems, section, subsection, programs, version_d)
            for system in systems:
                subsection = 'using'
                with open('overview_%s_%s.inc' % (subsection, system), 'a') as include_file:
                    include_file.write('\n\n%s\n' % underline_text(sections[section], '-'))
                    include_file.write('.. include:: overview_%s_%s_%s.inc\n' % (section, subsection, system))
                    build_doc_section_single_system(system, section, subsection, programs, version_d)

#-------------------------------------------------------------------------------

if __name__ == '__main__':
    main()
