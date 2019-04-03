package team.abc.ssm.modules.hr.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import team.abc.ssm.modules.hr.entity.SexInfo;

public interface SexInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(SexInfo record);

    int insertOrUpdate(SexInfo record);

    int insertOrUpdateSelective(SexInfo record);

    int insertSelective(SexInfo record);

    SexInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SexInfo record);

    int updateByPrimaryKey(SexInfo record);

    int updateBatch(List<SexInfo> list);

    int batchInsert(@Param("list") List<SexInfo> list);
}