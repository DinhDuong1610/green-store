package com.fourstars.greenstore.dto;

import lombok.Data;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.fourstars.greenstore.entities.User;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@Data

public class UserExcelExporter {
    private XSSFWorkbook workbook;
    private XSSFSheet sheet;

    private List<User> listUserDetails;

    public UserExcelExporter(List<User> listUserDetails) {
        this.listUserDetails = listUserDetails;
        workbook = new XSSFWorkbook();
        sheet = workbook.createSheet("UserDetails");
    }

    private void writeHeaderRow() {

        Row row = sheet.createRow(0);

        Cell cell = row.createCell(0);
        cell.setCellValue("Tên Người Dùng");

        cell = row.createCell(1);
        cell.setCellValue("Email");

        cell = row.createCell(2);
        cell.setCellValue("Ngày đăng ký");

        cell = row.createCell(3);
        cell.setCellValue("Trạng thái");

    }

    private void writeDataRows() {
        int rowCount = 1;

        CreationHelper creationHelper = workbook.getCreationHelper();
        CellStyle dateCellStyle = workbook.createCellStyle();
        dateCellStyle.setDataFormat(creationHelper.createDataFormat().getFormat("dd/MM/yyyy"));
        for (User user : listUserDetails) {
            Row row = sheet.createRow(rowCount++);

            Cell cell = row.createCell(0);
            cell.setCellValue(user.getName());

            cell = row.createCell(1);
            cell.setCellValue(user.getEmail());

            cell = row.createCell(2);
            Date registerDate = user.getRegisterDate();
            if (registerDate != null) {
                cell.setCellValue(registerDate);
                cell.setCellStyle(dateCellStyle);
            }

            cell = row.createCell(3);
            cell.setCellValue(user.getStatus());

        }

    }

    public void export(HttpServletResponse response) throws IOException {

        writeHeaderRow();
        writeDataRows();

        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();

    }
}
