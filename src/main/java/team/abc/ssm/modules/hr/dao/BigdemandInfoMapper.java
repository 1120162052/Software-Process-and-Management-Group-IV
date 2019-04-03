package team.abc.ssm.modules.hr.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import team.abc.ssm.modules.hr.entity.BigdemandInfo;

public interface BigdemandInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(BigdemandInfo record);

    int insertOrUpdate(BigdemandInfo record);

    int insertOrUpdateSelective(BigdemandInfo record);

    int insertSelective(BigdemandInfo record);

    BigdemandInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(BigdemandInfo record);

    int updateByPrimaryKey(BigdemandInfo record);

    int updateBatch(List<BigdemandInfo> list);

    int batchInsert(@Param("list") List<BigdemandInfo> list);
}