package team.abc.ssm.modules.hr.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import team.abc.ssm.modules.hr.entity.AgeInfo;

public interface AgeInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(AgeInfo record);

    int insertOrUpdate(AgeInfo record);

    int insertOrUpdateSelective(AgeInfo record);

    int insertSelective(AgeInfo record);

    AgeInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(AgeInfo record);

    int updateByPrimaryKey(AgeInfo record);

    int updateBatch(List<AgeInfo> list);

    int batchInsert(@Param("list") List<AgeInfo> list);
}