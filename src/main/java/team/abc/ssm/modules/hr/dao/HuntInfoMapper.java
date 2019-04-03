package team.abc.ssm.modules.hr.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import team.abc.ssm.modules.hr.entity.HuntInfo;

public interface HuntInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(HuntInfo record);

    int insertOrUpdate(HuntInfo record);

    int insertOrUpdateSelective(HuntInfo record);

    int insertSelective(HuntInfo record);

    HuntInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(HuntInfo record);

    int updateByPrimaryKey(HuntInfo record);

    int updateBatch(List<HuntInfo> list);

    int batchInsert(@Param("list") List<HuntInfo> list);
}