package com.cloud.hbase;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("hbase")
public class HbaseController {

	@Autowired
    private HBaseService hbaseService;
	
	@ResponseBody
	@RequestMapping("/hbasecreatetable")
	public R HbaseCreateTable() {
        //删除表
        hbaseService.deleteTable("test_base");

        //创建表
        hbaseService.createTableBySplitKeys("test_base", Arrays.asList("f","back"),hbaseService.getSplitKeys(null));

        //插入三条数据
        hbaseService.putData("test_base","66804_000001","f",new String[]{"project_id","varName","coefs","pvalues","tvalues","create_time"},new String[]{"40866","mob_3","0.9416","0.0000","12.2293","null"});
        hbaseService.putData("test_base","66804_000002","f",new String[]{"project_id","varName","coefs","pvalues","tvalues","create_time"},new String[]{"40866","idno_prov","0.9317","0.0000","9.8679","null"});
        hbaseService.putData("test_base","66804_000003","f",new String[]{"project_id","varName","coefs","pvalues","tvalues","create_time"},new String[]{"40866","education","0.8984","0.0000","25.5649","null"});

        //查询数据
        //1. 根据rowKey查询
        Map<String,String> result1 = hbaseService.getRowData("test_base","66804_000001");
        System.out.println("+++++++++++根据rowKey查询+++++++++++");
        result1.forEach((k,value) -> {
            System.out.println(k + "---" + value);
        });
        System.out.println();

        //精确查询某个单元格的数据
        String str1 = hbaseService.getColumnValue("test_base","66804_000002","f","varName");
        System.out.println("+++++++++++精确查询某个单元格的数据+++++++++++");
        System.out.println(str1);
        System.out.println();

        //2. 遍历查询
        Map<String,Map<String,String>> result2 = hbaseService.getResultScanner("test_base");
        System.out.println("+++++++++++遍历查询+++++++++++");
        result2.forEach((k,value) -> {
            System.out.println(k + "---" + value);
        });
        
        return R.ok().put("create", "test_base");
    }
	
	/**
     * 测试指定startRowKey和stopRowKey的查询
     */
    @ResponseBody
    @RequestMapping("/testSelectByStartStopRowKey")
    public R testSelectByStartStopRowKey(){
        Map<String,Map<String,String>> result = hbaseService.getResultScanner("test_base","66804_000002","66804_000004");
        result.forEach((rowKey,columnMap) -> {
            System.out.println("rowKey:" + rowKey);
            System.out.println("+++++++++++行数据+++++++++++");
            columnMap.forEach((k,value) -> {
                System.out.println(k + "---" + value);
            });
        });
        System.out.println("-----------------------");
	return R.ok();
    }
    
    /**
     * 测试获取所有表名
     */
    @ResponseBody
    @RequestMapping("/testGetTableNameLists")
    public R testGetTableNameLists(){
        List<String> result = hbaseService.getAllTableNames();

        result.forEach(System.out::println);
	return R.ok();
    }
    
    /**
     * 测试获取指定单元格多个版本的数据
     */
    @ResponseBody
    @RequestMapping("/testGetColumnValuesByVersion")
    public R testGetColumnValuesByVersion(){
        hbaseService.setColumnValue("test_base","66804_000002","f","varName","aa");
        hbaseService.setColumnValue("test_base","66804_000002","f","varName","bb");
        hbaseService.setColumnValue("test_base","66804_000002","f","varName","cc");
        hbaseService.setColumnValue("test_base","66804_000002","f","varName","dd");
        hbaseService.setColumnValue("test_base","66804_000002","f","varName","ee");

        List<String> result = hbaseService.getColumnValuesByVersion("test_base","66804_000002","f","varName",4);
        result.forEach(System.out::println);
	return R.ok();
    }

    
    /**
     * 测试根据行键过滤器查询数据
     */
    @ResponseBody
    @RequestMapping("/testGetResultScannerPrefixFilter")
    public R testGetResultScannerPrefixFilter(){
        hbaseService.putData("test_base","111","f",new String[]{"project_id","varName","coefs","pvalues","tvalues","create_time"},new String[]{"111","111","111","111","111","null"});
        hbaseService.putData("test_base","112","f",new String[]{"project_id","varName","coefs","pvalues","tvalues","create_time"},new String[]{"112","112","112","112","112","null"});

        Map<String,Map<String,String>> result = hbaseService.getResultScannerPrefixFilter("test_base","11");
        result.forEach((rowKey,columnMap) -> {
            System.out.println("-----------------------");
            System.out.println("rowKey:" + rowKey);
            System.out.println("+++++++++++行数据+++++++++++");
            columnMap.forEach((k,value) -> {
                System.out.println(k + "---" + value);
            });
            System.out.println("-----------------------");
        });
	return R.ok();
    }
    
    /**
     * 测试根据列名过滤器查询数据
     */
    @ResponseBody
    @RequestMapping("/testGetResultScannerColumnPrefixFilter")
    public R testGetResultScannerColumnPrefixFilter(){
        hbaseService.putData("test_base","211","f",new String[]{"project_id"},new String[]{"11111"});
        hbaseService.putData("test_base","211","f",new String[]{"var_name1"},new String[]{"111"});
        hbaseService.putData("test_base","212","f",new String[]{"var_name2"},new String[]{"112"});

        Map<String,Map<String,String>> result = hbaseService.getResultScannerColumnPrefixFilter("test_base","var_name");
        result.forEach((rowKey,columnMap) -> {
            System.out.println("-----------------------");
            System.out.println("rowKey:" + rowKey);
            System.out.println("+++++++++++行数据+++++++++++");
            columnMap.forEach((k,value) -> {
                System.out.println(k + "---" + value);
            });
            System.out.println("-----------------------");
        });
	return R.ok();
    }
    
    /**
     * 测试查询行键中包含特定字符的数据
     */
    @ResponseBody
    @RequestMapping("/testGetResultScannerRowFilter")
    public R testGetResultScannerRowFilter(){
        hbaseService.putData("test_base","abc666666def","f",new String[]{"project_id","varName","coefs","pvalues","tvalues","create_time"},new String[]{"111","abc6666def","111","111","111","null"});
        hbaseService.putData("test_base","cba666666fed","f",new String[]{"project_id","varName","coefs","pvalues","tvalues","create_time"},new String[]{"112","cba6666fed","112","112","112","null"});

        Map<String,Map<String,String>> result = hbaseService.getResultScannerRowFilter("test_base","666666");
        result.forEach((rowKey,columnMap) -> {
            System.out.println("-----------------------");
            System.out.println("rowKey:" + rowKey);
            System.out.println("+++++++++++行数据+++++++++++");
            columnMap.forEach((k,value) -> {
                System.out.println(k + "---" + value);
            });
            System.out.println("-----------------------");
        });
	return R.ok();
    }
    
    /**
     * 测试删除指定的列
     */
    @ResponseBody
    @RequestMapping("/testDeleteColumn")
    public R testDeleteColumn(){
        //新增一个测试列
        hbaseService.setColumnValue("test_base","66804_000002","f","xxx","123");
        String str = hbaseService.getColumnValue("test_base","66804_000002","f","xxx");
        System.out.println("第一次取值：" + str);

        //删除测试列
        hbaseService.deleteColumn("test_base","66804_000002","f","xxx");

        //再次取值
        String str2 = hbaseService.getColumnValue("test_base","66804_000002","f","xxx");
        System.out.println("第二次取值：" + str2);
	return R.ok();
    }

    /**
     * 测试删除指定的行
     */
    @ResponseBody
    @RequestMapping("/testDeleteRow")
    public R testDeleteRow(){
        //取值
        Map<String,String> result1 = hbaseService.getRowData("test_base","66804_000003");
        System.out.println("第一次取值输出：");
        result1.forEach((k,value) -> {
            System.out.println(k + "---" + value);
        });

        //删除测试行
        hbaseService.deleteRow("test_base","66804_000003");

        //再次取值
        Map<String,String> result2 = hbaseService.getRowData("test_base","66804_000003");
        System.out.println("第二次取值输出：");
        result2.forEach((k,value) -> {
            System.out.println(k + "---" + value);
        });
	return R.ok();
    }
    
    /**
     * 测试删除指定的列族
     */
    @ResponseBody
    @RequestMapping("/testDeleteColumnFamily")
    public R testDeleteColumnFamily(){
        //添加测试数据
        hbaseService.putData("test_base","777","back",new String[]{"var_name1"},new String[]{"777"});

        //取值
        Map<String,String> result1 = hbaseService.getRowData("test_base","777");
        System.out.println("第一次取值输出：");
        result1.forEach((k,value) -> {
            System.out.println(k + "---" + value);
        });

        //删除测试列族
        hbaseService.deleteColumnFamily("test_base","back");

        //再次取值
        Map<String,String> result2 = hbaseService.getRowData("test_base","777");
        System.out.println("第二次取值输出：");
        result2.forEach((k,value) -> {
            System.out.println(k + "---" + value);
        });
	return R.ok();
    }
	
}
