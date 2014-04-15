XML/XSLT
==========

### Given the relational model (schema.sql), create an application that will export a database content into an XML document, and then transforms it into different HTML and XML documents:

1. Create the following entity classes
  1. Site.java
  2. Tower.java
  3. Equipment.java

2. Write a class called SiteDatabase.java that contains a list of Site instances

3. Annotate the JPA and SiteDatabase classes so that they can be marshalled to XML files

4. Write a DAO class called SiteDao.java that implements the methods listed below
  1. public Site findSite(int siteId)
  2. public List<Site> findAllSites()
  3. public void exportSiteDatabaseToXmlFile(SiteDatabase database, String xmlFileName)
  4. public void convertXmlFileToOutputFile(string inputXmlFileName, String outputXmlFileName, String xsltFileName)
  5. main()
    1. Use findAllSites() to retrieve all the sites from the database
    2. Use exportSiteDatabaseToXmlFile() to export the site to a file called "xml/sites.xml"

5. Write the following XSLT files
  1. sites2html.xslt
  2. sites2equipment.xslt
