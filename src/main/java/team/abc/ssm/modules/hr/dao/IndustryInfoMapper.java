package team.abc.ssm.modules.hr.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import team.abc.ssm.modules.hr.entity.IndustryInfo;

public interface IndustryInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(IndustryInfo record);

    int insertOrUpdate(IndustryInfo record);

    int insertOrUpdateSelective(IndustryInfo record);

    int insertSelective(IndustryInfo record);

    IndustryInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(IndustryInfo record);

    int updateByPrimaryKey(IndustryInfo record);

    int updateBatch(List<IndustryInfo> list);

    int batchInsert(@Param("list") List<IndustryInfo> list);
}