package team.abc.ssm.modules.hr.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import team.abc.ssm.modules.hr.entity.CultureInfo;

public interface CultureInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CultureInfo record);

    int insertOrUpdate(CultureInfo record);

    int insertOrUpdateSelective(CultureInfo record);

    int insertSelective(CultureInfo record);

    CultureInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CultureInfo record);

    int updateByPrimaryKey(CultureInfo record);

    int updateBatch(List<CultureInfo> list);

    int batchInsert(@Param("list") List<CultureInfo> list);
}