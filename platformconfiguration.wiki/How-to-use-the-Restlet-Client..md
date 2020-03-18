This page describes how to use the Restlet Client.

The Kwantu platform uses the CouchDB database to store all aspects of applications and data. To access this database the **Restlet **Client plugin for the Google Chrome browser is used for REST API Testing and the storage and retrieval of configuration file documents. If you use Firefox, the equivalent is **Rester**.

The Client provides a URL type of entry preceded by a GET or PUT (for example) verb. You must have the URL to access a document, so when you create one, it's very important to store the URL that is returned in the local version of the document, for later reference. CouchDB offers what is termed as "buckets".  These are similar to directories in the absolute path of a file system. In this case the complete absolute path is always used in the URL to retrieve a specific document or version of a document.

There's more to be said...