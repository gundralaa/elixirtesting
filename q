APT-GET(8)                                                          APT                                                          APT-GET(8)

NNAAMMEE
       apt-get - APT package handling utility -- command-line interface

SSYYNNOOPPSSIISS
       aapptt--ggeett [--aassqqddyyffmmuubbVV] [--oo==_c_o_n_f_i_g___s_t_r_i_n_g] [--cc==_c_o_n_f_i_g___f_i_l_e] [--tt==_t_a_r_g_e_t___r_e_l_e_a_s_e] [--aa==_a_r_c_h_i_t_e_c_t_u_r_e] {update | upgrade | dselect-upgrade
               | dist-upgrade | install _p_k_g [{=_p_k_g___v_e_r_s_i_o_n___n_u_m_b_e_r | /_t_a_r_g_e_t___r_e_l_e_a_s_e}]...  | remove _p_k_g...  | purge _p_k_g...  |
               source _p_k_g [{=_p_k_g___v_e_r_s_i_o_n___n_u_m_b_e_r | /_t_a_r_g_e_t___r_e_l_e_a_s_e}]...  | build-dep _p_k_g [{=_p_k_g___v_e_r_s_i_o_n___n_u_m_b_e_r | /_t_a_r_g_e_t___r_e_l_e_a_s_e}]...  |
               download _p_k_g [{=_p_k_g___v_e_r_s_i_o_n___n_u_m_b_e_r | /_t_a_r_g_e_t___r_e_l_e_a_s_e}]...  | check | clean | autoclean | autoremove | {-v | --version} |
               {-h | --help}}

DDEESSCCRRIIPPTTIIOONN
       aapptt--ggeett is the command-line tool for handling packages, and may be considered the user's "back-end" to other tools using the APT
       library. Several "front-end" interfaces exist, such as aappttiittuuddee(8), ssyynnaappttiicc(8) and wwaajjiigg(1).

       Unless the --hh, or ----hheellpp option is given, one of the commands below must be present.

       uuppddaattee
           update is used to resynchronize the package index files from their sources. The indexes of available packages are fetched from
           the location(s) specified in /etc/apt/sources.list. For example, when using a Debian archive, this command retrieves and scans
           the Packages.gz files, so that information about new and updated packages is available. An update should always be performed
           before an upgrade or dist-upgrade. Please be aware that the overall progress meter will be incorrect as the size of the package
           files cannot be known in advance.

       uuppggrraaddee
           upgrade is used to install the newest versions of all packages currently installed on the system from the sources enumerated in
           /etc/apt/sources.list. Packages currently installed with new versions available are retrieved and upgraded; under no
           circumstances are currently installed packages removed, or packages not already installed retrieved and installed. New versions
           of currently installed packages that cannot be upgraded without changing the install status of another package will be left at
           their current version. An update must be performed first so that aapptt--ggeett knows that new versions of packages are available.

       ddiisstt--uuppggrraaddee
           dist-upgrade in addition to performing the function of upgrade, also intelligently handles changing dependencies with new
           versions of packages; aapptt--ggeett has a "smart" conflict resolution system, and it will attempt to upgrade the most important
           packages at the expense of less important ones if necessary. The dist-upgrade command may therefore remove some packages. The
           /etc/apt/sources.list file contains a list of locations from which to retrieve desired package files. See also
           aapptt__pprreeffeerreenncceess(5) for a mechanism for overriding the general settings for individual packages.

       ddsseelleecctt--uuppggrraaddee
           dselect-upgrade is used in conjunction with the traditional Debian packaging front-end, ddsseelleecctt(1).  dselect-upgrade follows the
           changes made by ddsseelleecctt(1) to the Status field of available packages, and performs the actions necessary to realize that state
           (for instance, the removal of old and the installation of new packages).

       iinnssttaallll
           install is followed by one or more packages desired for installation or upgrading. Each package is a package name, not a fully
           qualified filename (for instance, in a Debian system, apt-utils would be the argument provided, not apt-utils_1.2.15_amd64.deb).
           All packages required by the package(s) specified for installation will also be retrieved and installed. The
           /etc/apt/sources.list file is used to locate the desired packages. If a hyphen is appended to the package name (with no
           intervening space), the identified package will be removed if it is installed. Similarly a plus sign can be used to designate a
           package to install. These latter features may be used to override decisions made by apt-get's conflict resolution system.

           A specific version of a package can be selected for installation by following the package name with an equals and the version of
           the package to select. This will cause that version to be located and selected for install. Alternatively a specific
           distribution can be selected by following the package name with a slash and the version of the distribution or the Archive name
           (stable, testing, unstable).

           Both of the version selection mechanisms can downgrade packages and must be used with care.

           This is also the target to use if you want to upgrade one or more already-installed packages without upgrading every package you
           have on your system. Unlike the "upgrade" target, which installs the newest version of all currently installed packages,
           "install" will install the newest version of only the package(s) specified. Simply provide the name of the package(s) you wish
           to upgrade, and if a newer version is available, it (and its dependencies, as described above) will be downloaded and installed.

           Finally, the aapptt__pprreeffeerreenncceess(5) mechanism allows you to create an alternative installation policy for individual packages.

           If no package matches the given expression and the expression contains one of '.', '?' or '*' then it is assumed to be a POSIX
           regular expression, and it is applied to all package names in the database. Any matches are then installed (or removed). Note
           that matching is done by substring so 'lo.*' matches 'how-lo' and 'lowest'. If this is undesired, anchor the regular expression
           with a '^' or '$' character, or create a more specific regular expression.

       rreemmoovvee
           remove is identical to install except that packages are removed instead of installed. Note that removing a package leaves its
           configuration files on the system. If a plus sign is appended to the package name (with no intervening space), the identified
           package will be installed instead of removed.

       ppuurrggee
           purge is identical to remove except that packages are removed and purged (any configuration files are deleted too).

       ssoouurrccee
           source causes aapptt--ggeett to fetch source packages. APT will examine the available packages to decide which source package to fetch.
           It will then find and download into the current directory the newest available version of that source package while respecting
           the default release, set with the option APT::Default-Release, the --tt option or per package with the pkg/release syntax, if
           possible.

           Source packages are tracked separately from binary packages via deb-src lines in the ssoouurrcceess..lliisstt(5) file. This means that you
           will need to add such a line for each repository you want to get sources from; otherwise you will probably get either the wrong
           (too old/too new) source versions or none at all.

           If the ----ccoommppiillee option is specified then the package will be compiled to a binary .deb using ddppkkgg--bbuuiillddppaacckkaaggee for the
           architecture as defined by the ----hhoosstt--aarrcchhiitteeccttuurree option. If ----ddoowwnnllooaadd--oonnllyy is specified then the source package will not be
           unpacked.

           A specific source version can be retrieved by postfixing the source name with an equals and then the version to fetch, similar
           to the mechanism used for the package files. This enables exact matching of the source package name and version, implicitly
           enabling the APT::Get::Only-Source option.

           Note that source packages are not installed and tracked in the ddppkkgg database like binary packages; they are simply downloaded to
           the current directory, like source tarballs.

       bbuuiilldd--ddeepp
           build-dep causes apt-get to install/remove packages in an attempt to satisfy the build dependencies for a source package. By
           default the dependencies are satisfied to build the package natively. If desired a host-architecture can be specified with the
           ----hhoosstt--aarrcchhiitteeccttuurree option instead.

       cchheecckk
           check is a diagnostic tool; it updates the package cache and checks for broken dependencies.

       ddoowwnnllooaadd
           download will download the given binary package into the current directory.

       cclleeaann
           clean clears out the local repository of retrieved package files. It removes everything but the lock file from
           /var/cache/apt/archives/ and /var/cache/apt/archives/partial/.

       aauuttoocclleeaann (and the aauuttoo--cclleeaann alias since 1.1)
           Like clean, autoclean clears out the local repository of retrieved package files. The difference is that it only removes package
           files that can no longer be downloaded, and are largely useless. This allows a cache to be maintained over a long period without
           it growing out of control. The configuration option APT::Clean-Installed will prevent installed packages from being erased if it
           is set to off.

       aauuttoorreemmoovvee (and the aauuttoo--rreemmoovvee alias since 1.1)
           autoremove is used to remove packages that were automatically installed to satisfy dependencies for other packages and are now
           no longer needed.

       cchhaannggeelloogg
           changelog tries to download the changelog of a package and displays it through sseennssiibbllee--ppaaggeerr. By default it displays the
           changelog for the version that is installed. However, you can specify the same options as for the iinnssttaallll command.

       iinnddeexxttaarrggeettss
           Displays by default a deb822 formatted listing of information about all data files (aka index targets) aapptt--ggeett uuppddaattee would
           download. Supports a ----ffoorrmmaatt option to modify the output format as well as accepts lines of the default output to filter the
           records by. The command is mainly used as an interface for external tools working with APT to get information as well as
           filenames for downloaded files so they can use them as well instead of downloading them again on their own. Detailed
           documentation is omitted here and can instead be found in the source tree in doc/acquire-additional-files.txt.

OOPPTTIIOONNSS
       All command line options may be set using the configuration file, the descriptions indicate the configuration option to set. For
       boolean options you can override the config file by using something like --ff--,----nnoo--ff, --ff==nnoo or several other variations.

       ----nnoo--iinnssttaallll--rreeccoommmmeennddss
           Do not consider recommended packages as a dependency for installing. Configuration Item: APT::Install-Recommends.

       ----iinnssttaallll--ssuuggggeessttss
           Consider suggested packages as a dependency for installing. Configuration Item: APT::Install-Suggests.

       --dd, ----ddoowwnnllooaadd--oonnllyy
           Download only; package files are only retrieved, not unpacked or installed. Configuration Item: APT::Get::Download-Only.

       --ff, ----ffiixx--bbrrookkeenn
           Fix; attempt to correct a system with broken dependencies in place. This option, when used with install/remove, can omit any
           packages to permit APT to deduce a likely solution. If packages are specified, these have to completely correct the problem. The
           option is sometimes necessary when running APT for the first time; APT itself does not allow broken package dependencies to
           exist on a system. It is possible that a system's dependency structure can be so corrupt as to require manual intervention
           (which usually means using ddppkkgg ----rreemmoovvee to eliminate some of the offending packages). Use of this option together with --mm may
           produce an error in some situations. Configuration Item: APT::Get::Fix-Broken.

       --mm, ----iiggnnoorree--mmiissssiinngg, ----ffiixx--mmiissssiinngg
           Ignore missing packages; if packages cannot be retrieved or fail the integrity check after retrieval (corrupted package files),
           hold back those packages and handle the result. Use of this option together with --ff may produce an error in some situations. If
           a package is selected for installation (particularly if it is mentioned on the command line) and it could not be downloaded then
           it will be silently held back. Configuration Item: APT::Get::Fix-Missing.

       ----nnoo--ddoowwnnllooaadd
           Disables downloading of packages. This is best used with ----iiggnnoorree--mmiissssiinngg to force APT to use only the .debs it has already
           downloaded. Configuration Item: APT::Get::Download.

       --qq, ----qquuiieett
           Quiet; produces output suitable for logging, omitting progress indicators. More q's will produce more quiet up to a maximum of
           2. You can also use --qq==## to set the quiet level, overriding the configuration file. Note that quiet level 2 implies --yy; you
           should never use -qq without a no-action modifier such as -d, --print-uris or -s as APT may decide to do something you did not
           expect. Configuration Item: quiet.

       --ss, ----ssiimmuullaattee, ----jjuusstt--pprriinntt, ----ddrryy--rruunn, ----rreeccoonn, ----nnoo--aacctt
           No action; perform a simulation of events that would occur based on the current system state but do not actually change the
           system. Locking will be disabled (DDeebbuugg::::NNooLLoocckkiinngg) so the system state could change while aapptt--ggeett is running. Simulations can
           also be executed by non-root users which might not have read access to all apt configuration distorting the simulation. A notice
           expressing this warning is also shown by default for non-root users (AAPPTT::::GGeett::::SShhooww--UUsseerr--SSiimmuullaattiioonn--NNoottee). Configuration Item:
           APT::Get::Simulate.

           Simulated runs print out a series of lines, each representing a ddppkkgg operation: configure (Conf), remove (Remv) or unpack
           (Inst). Square brackets indicate broken packages, and empty square brackets indicate breaks that are of no consequence (rare).

       --yy, ----yyeess, ----aassssuummee--yyeess
           Automatic yes to prompts; assume "yes" as answer to all prompts and run non-interactively. If an undesirable situation, such as
           changing a held package, trying to install a unauthenticated package or removing an essential package occurs then apt-get will
           abort. Configuration Item: APT::Get::Assume-Yes.

       ----aassssuummee--nnoo
           Automatic "no" to all prompts. Configuration Item: APT::Get::Assume-No.

       --uu, ----sshhooww--uuppggrraaddeedd
           Show upgraded packages; print out a list of all packages that are to be upgraded. Configuration Item: APT::Get::Show-Upgraded.

       --VV, ----vveerrbboossee--vveerrssiioonnss
           Show full versions for upgraded and installed packages. Configuration Item: APT::Get::Show-Versions.

       --aa, ----hhoosstt--aarrcchhiitteeccttuurree
           This option controls the architecture packages are built for by aapptt--ggeett ssoouurrccee ----ccoommppiillee and how cross-builddependencies are
           satisfied. By default is it not set which means that the host architecture is the same as the build architecture (which is
           defined by APT::Architecture). Configuration Item: APT::Get::Host-Architecture.

       --PP, ----bbuuiilldd--pprrooffiilleess
           This option controls the activated build profiles for which a source package is built by aapptt--ggeett ssoouurrccee ----ccoommppiillee and how build
           dependencies are satisfied. By default no build profile is active. More than one build profile can be activated at a time by
           concatenating them with a comma. Configuration Item: APT::Build-Profiles.

       --bb, ----ccoommppiillee, ----bbuuiilldd
           Compile source packages after downloading them. Configuration Item: APT::Get::Compile.

       ----iiggnnoorree--hhoolldd
           Ignore package holds; this causes aapptt--ggeett to ignore a hold placed on a package. This may be useful in conjunction with
           dist-upgrade to override a large number of undesired holds. Configuration Item: APT::Ignore-Hold.

       ----wwiitthh--nneeww--ppkkggss
           Allow installing new packages when used in conjunction with upgrade. This is useful if the update of a installed package
           requires new dependencies to be installed. Instead of holding the package back upgrade will upgrade the package and install the
           new dependencies. Note that upgrade with this option will never remove packages, only allow adding new ones. Configuration Item:
           APT::Get::Upgrade-Allow-New.

       ----nnoo--uuppggrraaddee
           Do not upgrade packages; when used in conjunction with install, no-upgrade will prevent packages on the command line from being
           upgraded if they are already installed. Configuration Item: APT::Get::Upgrade.

       ----oonnllyy--uuppggrraaddee
           Do not install new packages; when used in conjunction with install, only-upgrade will install upgrades for already installed
           packages only and ignore requests to install new packages. Configuration Item: APT::Get::Only-Upgrade.

       ----aallllooww--ddoowwnnggrraaddeess
           This is a dangerous option that will cause apt to continue without prompting if it is doing downgrades. It should not be used
           except in very special situations. Using it can potentially destroy your system! Configuration Item: APT::Get::allow-downgrades.
           Introduced in APT 1.1.

       ----aallllooww--rreemmoovvee--eesssseennttiiaall
           Force yes; this is a dangerous option that will cause apt to continue without prompting if it is removing essentials. It should
           not be used except in very special situations. Using it can potentially destroy your system! Configuration Item:
           APT::Get::allow-remove-essential. Introduced in APT 1.1.

       ----aallllooww--cchhaannggee--hheelldd--ppaacckkaaggeess
           Force yes; this is a dangerous option that will cause apt to continue without prompting if it is changing held packages. It
           should not be used except in very special situations. Using it can potentially destroy your system! Configuration Item:
           APT::Get::allow-change-held-packages. Introduced in APT 1.1.

       ----ffoorrccee--yyeess
           Force yes; this is a dangerous option that will cause apt to continue without prompting if it is doing something potentially
           harmful. It should not be used except in very special situations. Using force-yes can potentially destroy your system!
           Configuration Item: APT::Get::force-yes. This is deprecated and replaced by ----aallllooww--ddoowwnnggrraaddeess, ----aallllooww--rreemmoovvee--eesssseennttiiaall,
           ----aallllooww--cchhaannggee--hheelldd--ppaacckkaaggeess in 1.1.

       ----pprriinntt--uurriiss
           Instead of fetching the files to install their URIs are printed. Each URI will have the path, the destination file name, the
           size and the expected MD5 hash. Note that the file name to write to will not always match the file name on the remote site! This
           also works with the source and update commands. When used with the update command the MD5 and size are not included, and it is
           up to the user to decompress any compressed files. Configuration Item: APT::Get::Print-URIs.

       ----ppuurrggee
           Use purge instead of remove for anything that would be removed. An asterisk ("*") will be displayed next to packages which are
           scheduled to be purged.  rreemmoovvee ----ppuurrggee is equivalent to the ppuurrggee command. Configuration Item: APT::Get::Purge.

       ----rreeiinnssttaallll
           Re-install packages that are already installed and at the newest version. Configuration Item: APT::Get::ReInstall.

       ----lliisstt--cclleeaannuupp
           This option is on by default; use --no-list-cleanup to turn it off. When it is on, aapptt--ggeett will automatically manage the
           contents of /var/lib/apt/lists to ensure that obsolete files are erased. The only reason to turn it off is if you frequently
           change your sources list. Configuration Item: APT::Get::List-Cleanup.

       --tt, ----ttaarrggeett--rreelleeaassee, ----ddeeffaauulltt--rreelleeaassee
           This option controls the default input to the policy engine; it creates a default pin at priority 990 using the specified
           release string. This overrides the general settings in /etc/apt/preferences. Specifically pinned packages are not affected by
           the value of this option. In short, this option lets you have simple control over which distribution packages will be retrieved
           from. Some common examples might be --tt ''22..11**'', --tt uunnssttaabbllee or --tt ssiidd. Configuration Item: APT::Default-Release; see also the
           aapptt__pprreeffeerreenncceess(5) manual page.

       ----ttrriivviiaall--oonnllyy
           Only perform operations that are 'trivial'. Logically this can be considered related to ----aassssuummee--yyeess; where ----aassssuummee--yyeess will
           answer yes to any prompt, ----ttrriivviiaall--oonnllyy will answer no. Configuration Item: APT::Get::Trivial-Only.

       ----nnoo--rreemmoovvee
           If any packages are to be removed apt-get immediately aborts without prompting. Configuration Item: APT::Get::Remove.

       ----aauuttoo--rreemmoovvee, ----aauuttoorreemmoovvee
           If the command is either install or remove, then this option acts like running the autoremove command, removing unused
           dependency packages. Configuration Item: APT::Get::AutomaticRemove.

       ----oonnllyy--ssoouurrccee
           Only has meaning for the source and build-dep commands. Indicates that the given source names are not to be mapped through the
           binary table. This means that if this option is specified, these commands will only accept source package names as arguments,
           rather than accepting binary package names and looking up the corresponding source package. Configuration Item:
           APT::Get::Only-Source.

       ----ddiiffff--oonnllyy, ----ddsscc--oonnllyy, ----ttaarr--oonnllyy
           Download only the diff, dsc, or tar file of a source archive. Configuration Item: APT::Get::Diff-Only, APT::Get::Dsc-Only, and
           APT::Get::Tar-Only.

       ----aarrcchh--oonnllyy
           Only process architecture-dependent build-dependencies. Configuration Item: APT::Get::Arch-Only.

       ----aallllooww--uunnaauutthheennttiiccaatteedd
           Ignore if packages can't be authenticated and don't prompt about it. This can be useful while working with local repositories,
           but is a huge security risk if data authenticity isn't ensured in another way by the user itself. The usage of the TTrruusstteedd
           option for ssoouurrcceess..lliisstt(5) entries should usually be preferred over this global override. Configuration Item:
           APT::Get::AllowUnauthenticated.

       ----nnoo--aallllooww--iinnsseeccuurree--rreeppoossiittoorriieess
           Forbid the update command to acquire unverifiable data from configured sources. Apt will fail at the update command for
           repositories without valid cryptographically signatures. Configuration Item: Acquire::AllowInsecureRepositories.

       ----sshhooww--pprrooggrreessss
           Show user friendly progress information in the terminal window when packages are installed, upgraded or removed. For a machine
           parsable version of this data see README.progress-reporting in the apt doc directory. Configuration Item: Dpkg::Progress and
           Dpkg::Progress-Fancy.

       --hh, ----hheellpp
           Show a short usage summary.

       --vv, ----vveerrssiioonn
           Show the program version.

       --cc, ----ccoonnffiigg--ffiillee
           Configuration File; Specify a configuration file to use. The program will read the default configuration file and then this
           configuration file. If configuration settings need to be set before the default configuration files are parsed specify a file
           with the AAPPTT__CCOONNFFIIGG environment variable. See aapptt..ccoonnff(5) for syntax information.

       --oo, ----ooppttiioonn
           Set a Configuration Option; This will set an arbitrary configuration option. The syntax is --oo FFoooo::::BBaarr==bbaarr.  --oo and ----ooppttiioonn can
           be used multiple times to set different options.

FFIILLEESS
       /etc/apt/sources.list
           Locations to fetch packages from. Configuration Item: Dir::Etc::SourceList.

       /etc/apt/sources.list.d/
           File fragments for locations to fetch packages from. Configuration Item: Dir::Etc::SourceParts.

       /etc/apt/apt.conf
           APT configuration file. Configuration Item: Dir::Etc::Main.

       /etc/apt/apt.conf.d/
           APT configuration file fragments. Configuration Item: Dir::Etc::Parts.

       /etc/apt/preferences
           Version preferences file. This is where you would specify "pinning", i.e. a preference to get certain packages from a separate
           source or from a different version of a distribution. Configuration Item: Dir::Etc::Preferences.

       /etc/apt/preferences.d/
           File fragments for the version preferences. Configuration Item: Dir::Etc::PreferencesParts.

       /var/cache/apt/archives/
           Storage area for retrieved package files. Configuration Item: Dir::Cache::Archives.

       /var/cache/apt/archives/partial/
           Storage area for package files in transit. Configuration Item: Dir::Cache::Archives (partial will be implicitly appended)

       /var/lib/apt/lists/
           Storage area for state information for each package resource specified in ssoouurrcceess..lliisstt(5) Configuration Item: Dir::State::Lists.

       /var/lib/apt/lists/partial/
           Storage area for state information in transit. Configuration Item: Dir::State::Lists (partial will be implicitly appended)

SSEEEE AALLSSOO
       aapptt--ccaacchhee(8), aapptt--ccddrroomm(8), ddppkkgg(1), ssoouurrcceess..lliisstt(5), aapptt..ccoonnff(5), aapptt--ccoonnffiigg(8), aapptt--sseeccuurree(8), The APT User's guide in
       /usr/share/doc/apt-doc/, aapptt__pprreeffeerreenncceess(5), the APT Howto.

DDIIAAGGNNOOSSTTIICCSS
       aapptt--ggeett returns zero on normal operation, decimal 100 on error.

BBUUGGSS
       AAPPTT bbuugg ppaaggee[1]. If you wish to report a bug in APT, please see /usr/share/doc/debian/bug-reporting.txt or the rreeppoorrttbbuugg(1) command.

AAUUTTHHOORRSS
       JJaassoonn GGuunntthhoorrppee

       AAPPTT tteeaamm

NNOOTTEESS
        1. APT bug page
           http://bugs.debian.org/src:apt

APT 1.2.15                                                    05 October 2016                                                    APT-GET(8)
