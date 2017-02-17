One of the foundational issues in HPC computing is the ability to move large (multi Gigabyte, and even Terabyte), file-based data sets between sites. Simple file transfer mechanisms such as FTP and SCP are not sufficient either from a reliability or performance perspective. GridFTP extends the standard FTP protocol to provide a high-performance, secure, reliable protocol for bulk data transfer.

The toolkit includes software for security, information infrastructure, resource management, data management, communication, fault detection, and portability. It is packaged as a set of components that can be used either independently or together to develop applications.

Its core services, interfaces and protocols allow users to access remote resources as if they were located within their own machine room while simultaneously preserving local control over 

GridFTP Protocol
________________

GridFTP is a protocol defined by Global Grid Forum Recommendation GFD.020, RFC 959, RFC 2228, RFC 2389, and a draft before the IETF FTP working group. Key features include::
    **Performance** - GridFTP protocol supports using parallel TCP streams and multi-node transfers to achieve high performance.
    **Checkpointing** - GridFTP protocol requires that the server send restart markers (checkpoint) to the client.
    **Third-party transfers** - The FTP protocol on which GridFTP is based separates control and data channels, enabling third-party transfers, that is, the transfer of data between two end hosts, mediated by a third host.
    **Security** - Provides strong security on both control and data channels. Control channel is encrypted by default. Data channel is authenticated by default with optional integrity protection and encryption.
http://http://toolkit.globus.org/toolkit/about.html
