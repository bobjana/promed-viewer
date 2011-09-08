import org.apache.commons.io.FileUtils

class AttachmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def dataSource

    def list() {
        def attachments = new ArrayList<Attachment>()
		groovy.sql.Sql sql = new groovy.sql.Sql(dataSource)
        def extensionCategorySummarySQL = """
            Select idDocStore, cDocStoreName, cDocName, cdocDescription, vDocStorePath
            from _rvIncidentsFull
            left Join _rtblDocLinks
            on ilinkid = IncidentID
            and iLinkSource = 1
            left Join _rtblDocStore
            on _rtblDocStore.idDocStore  = _rtblDocLinks.iDocStoreID
            cross join _rtblCMDefaults
            where IncidentID = ${params.id}
        """

		sql.eachRow(extensionCategorySummarySQL,
            { row ->
                attachments.add(new Attachment(id:row[0],resourceId:row[1],name:row[2],description:row[3],path:row[4]))
            }
		)
        [attachments:attachments]
    }

    def download(){
        def attachment = findAttachmentById(params.id)
        def extension = getFileNameExtension(attachment.name)
        def file = new File(attachment.path, attachment.resourceId)
        if (!file.exists()){
            log.error("Unable to download attachment as file '${attachment.name}' does not exist under location '${file.getAbsolutePath()}'")
            throw new RuntimeException("Critical error has occured -  File does not exist! Please contact your administrator")
        }
        def data = FileUtils.readFileToByteArray(file)
        response.setContentType("application/${extension}")
        response.setHeader("Content-disposition", "attachment; filename=\"${attachment.name}\"")
        response.setContentLength(data.length)
        response.getOutputStream().write(data)
    }

    private String getFileNameExtension(String name) {
        if (name == null || name.lastIndexOf(".") == -1){
            return ""
        }
        return name.substring(name.lastIndexOf(".") + 1)
    }

    private Attachment findAttachmentById(def id) {
        groovy.sql.Sql sql = new groovy.sql.Sql(dataSource)
        def extensionCategorySummarySQL = """
            Select idDocStore, cDocStoreName, cDocName, cdocDescription, vDocStorePath
            from _rtblDocStore
            cross join _rtblCMDefaults
            where idDocStore = ${params.id}
        """
        def attachment
		sql.eachRow(extensionCategorySummarySQL,
            { row ->
                attachment = new Attachment(id:row[0],resourceId:row[1],name:row[2],description:row[3],path:row[4])
            }
		)
        return attachment
    }

}
