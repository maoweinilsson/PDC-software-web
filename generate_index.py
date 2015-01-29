
"""
This script crawls through subdirectories of software/
and generates include files
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

def generate_table(title_line, programs, version_d, systems, section):
    """
    Build table with hyperlinks.
    Function checks whether corresponding files exist and only
    includes the version where documentation is present.
    """
    import os

    table_body = []
    for program in programs:
        for system in systems:
            line = []
            for version in version_d[program]:
                if os.path.isfile(os.path.join('software', program, system.lower(), version, '%s.rst' % section)):
                    if len(programs) > 1:
                        line.append(":doc:`%s <software/%s/%s/%s/%s>`" % (version, program, system.lower(), version, section))
                    else:
                        line.append(":doc:`%s <%s/%s/%s>`" % (version, system.lower(), version, section))
            if len(line) > 0:
                if len(programs) > 1:
                    table_body.append([':doc:`%s <software/%s/general>`' % (program, program), system, ', '.join(line)])
                else:
                    table_body.append([system, ', '.join(line)])

    if table_body:
        table = []
        table.append(title_line)
        for line in table_body:
            table.append(line)
        return table

    return []

#-------------------------------------------------------------------------------

def main():
    """
    Main function.
    """
    import os

    # sorting of version numbers
    from distutils.version import LooseVersion

    systems = ['Beskow', 'Ellen', 'Lindgren', 'Povel', 'Zorn']

    software_path = os.path.join(os.getcwd(), 'software')

    # get list of all installed programs
    programs = []
    version_d = {}
    for root, _, filenames in os.walk(software_path):
        for name in filenames:
            if name == 'general.rst':
                program = root.split('/')[-1]
                programs.append(program)
                version_d[program] = []

    # get list of all installed versions
    for root, _, filenames in os.walk(software_path):
        for name in filenames:
            if name == 'running.rst' or name == 'building.rst':
                version = root.split('/')[-1]
                program = root.split('/')[-3]
                if version not in version_d[program]:
                    version_d[program].append(version)

    # sort programs
    programs = sorted(programs, key=lambda s: s.lower())

    # sort versions
    for program in programs:
        version_d[program].sort(reverse=True, key=LooseVersion)

    # build include files which contain title and version
    for program in programs:
        for version in version_d[program]:
            for system in systems:
                for section in ['Running', 'Building']:
                    if os.path.isfile(os.path.join('software', program, system.lower(), version, '%s.rst' % section.lower())):
                        with open(os.path.join('software', program, system.lower(), version, '%s.inc' % section.lower()), 'w') as f_include:

                            # add navigation
                            f_include.write(":doc:`../../../../index` - :doc:`../../general` - :doc:`%s`\n\n" % section.lower())

                            text = '%s %s %s on %s' % (section, program, version, system)
                            f_include.write('%s\n' % underline_text(text, '='))

    # here we remove Lindgren
    # we need it for the above until we also remove the files from the repo
    systems.remove('Lindgren')

    # this generates a version overview for each program separately
    for program in programs:
        with open(os.path.join('software', program, 'include.inc'), 'w') as f_program:

            # add navigation
            f_program.write(":doc:`../../index` - :doc:`general`\n\n")

            f_program.write("%s\n\n" % underline_text("General information about %s" % program, '='))
            for section in ['Running', 'Building']:
                title_line = ['System', '%s instructions' % section]
                table = generate_table(title_line, [program], version_d, systems, '%s' % section.lower())
                if table:
                    f_program.write('\n\n')
                    f_program.write(get_sphinx_table(table))

    # generate main index file
    title_line = ['Program', 'System', 'Available versions']
    with open('include.inc', 'w') as include_file:
        include_file.write('\n\n%s\n' % underline_text('Software at PDC', '='))
        for section in ['Running', 'Building']:
            include_file.write('\n\n%s\n' % underline_text('%s software' % section, '-'))
            table = generate_table(title_line, programs, version_d, systems, '%s' % section.lower())
            include_file.write(get_sphinx_table(table))

#-------------------------------------------------------------------------------

if __name__ == '__main__':
    main()
